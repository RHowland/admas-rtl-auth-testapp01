// lib/auth.actions.ts
/**
 * ---------------------------------------------------------------------
 * File Name      : auth.actions.ts
 * Module Name    : Authentication Actions
 * Module Type    : Server Module
 * Date Created   : 2024-07-01
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Module Purpose:
 * This module handles the authentication actions such as user sign-up, sign-in, sign-out, password reset, and email verification. It interacts with the database, manages user sessions, and sends verification emails.
 * ------------------------------
 * Functions:
 * - signUp: Registers a new user, stores their details in the database, and sends a verification email.
 * - newPassword: Resets the user's password if the provided token is valid.
 * - resendEmailVerification: Resends the email verification link to the user's email.
 * - resetPassword: Sends a password reset link to the user's email if the email is registered and verified.
 * - signIn: Authenticates the user, creates a session, and sets a session cookie.
 * - signOut: Invalidates the user's session and clears the session cookie.
 * ------------------------------
 * Input Comments:     (Enter "none" if you have no comments)
 * - All input validation is handled by Zod schemas.
 * ------------------------------
 * Output Comments:    (Enter "none" if you have no comments)
 * - All functions return a success message or an error message.
 * ------------------------------
 * Additional Comments:
 * - The module uses Argon2 for password hashing and verification.
 * - The module uses UUID for generating unique user IDs.
 * - The module interacts with a database using the Drizzle ORM.
 * - The module sends emails using a mail service.
 * Question: Did you have to write  unusual code?
 * Answer  : NO.
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Function: signUp
 * Description: Registers a new user and sends a verification email.
 * Input: User details (name, email, password)
 * Output: Success or error message
 * 
 * Function: newPassword
 * Description: Resets the user's password if the provided token is valid.
 * Input: New password, token
 * Output: Success or error message
 * 
 * Function: resendEmailVerification
 * Description: Resends the email verification link to the user's email.
 * Input: User email
 * Output: Success or error message
 * 
 * Function: resetPassword
 * Description: Sends a password reset link to the user's email if the email is registered and verified.
 * Input: User email
 * Output: Success or error message
 * 
 * Function: signIn
 * Description: Authenticates the user, creates a session, and sets a session cookie.
 * Input: User email, password
 * Output: Success or error message
 * 
 * Function: signOut
 * Description: Invalidates the user's session and clears the session cookie.
 * Input: None
 * Output: Success or error message
 * ------------------------------
 */



"use server"

import * as v from 'valibot'
import { SignInSchema, SignUpSchema ,ResetPasswordSchema, NewPasswordSchema } from "@root/src/valibot/SchemaTypes"
import { lucia, validateRequest } from "@/lib/lucia"
import { cookies } from "next/headers"
import * as argon2 from "argon2"
import { InferSelectModel   } from "drizzle-orm";

import {  users as userSchema } from "@/lib/database/schema"
import { db } from "@root/dbConnect"
import { eq } from "drizzle-orm"
import { MailType } from "@root/src/types"
import { storeToken } from "./storeToken"
import { generateMailReact, sendMailTask } from "../mail-service"
import { verifyToken } from "./verifyToken"
import { formatDate } from '../utils'
import { canLogedIn, recordFaildLoginAttempt, removeFaildLoginAttempt } from './loginAttempts'



const sendMail = async ( user : InferSelectModel<typeof userSchema> , mailtype: MailType ) => {

  const userId = user.id
  const userName = user.userName ?? "Mr."
  const userEmail = user.userEmail

  const { token , expiresHours  } = await storeToken({type : mailtype , userId});

  const verificationLink = `${process.env.NEXT_PUBLIC_BASE_URL}/verify-token?token=${token}&type=${mailtype}`;
  
  const mailReact = generateMailReact({ userName, tokenUrl : verificationLink , token , type : mailtype , expiresTime : `${expiresHours} Hours` });

  const { id : messageId } = await sendMailTask({type: mailtype , react : mailReact ,targetMail : userEmail  , subject : "Email Verifications" });
  
  return messageId
}


export const signUp = async (values: v.InferOutput<typeof SignUpSchema>) => {
  try {
    const parsedResult = v.safeParse(SignUpSchema, values);
    if(!parsedResult.success) throw new Error(parsedResult.issues.toLocaleString())

    const hashedPassword = await argon2.hash(values.password)

    const existingUsers  = await db.select().from(userSchema).where(eq(userSchema.userEmail ,values.email ));
    if(existingUsers[0] || existingUsers.length > 0){
      return {
        error: "Email Already Registered",
      }
    }

    const user =  {
      userFirstName : values.firstName,
      userLastName : values.lastName,
      userName: values.firstName + ' ' + values.lastName,
      userEmail: values.email,
      hashedPassword,
      updatedAt: formatDate(),
      bypassRbacFlag : 'N',
      softDeleteFlag: 'N'
    }
  
    const storedUser =  await db.insert(userSchema).values(user).returning();
    
    const messageId =  await sendMail(storedUser[0] , MailType["signUpVerify"])

    return {
      success: true,
      message: "SignUp Successful! Please Verify Your Email.",
      data: {
        userId : storedUser[0].id,
        messageId
      },
    }
  } catch (error: any ) {
    return {
      error: error?.message,
    }
  }
}

export const newPassword = async (values: v.InferOutput<typeof NewPasswordSchema> , token : string) => {
  const tokenResult = await  verifyToken(token , "newPassword")
  if(!tokenResult.success){
    return {
      error: "Reset Password Token isn't valid",
    } 
  }
  
  try {
    const existingUsers   = await db.select().from(userSchema).where(eq(userSchema.id , tokenResult.data.userId ));
    if(!existingUsers[0] || existingUsers.length === 0){
      return {
        error: "User isn't registered yet. Please SignUp",
      }
    }
    const hashedPassword = await argon2.hash(values.password)
    await db.update(userSchema).set({hashedPassword, updatedAt : formatDate()}).where(eq(userSchema.id , existingUsers[0].id )).returning();

  

    return {
      success: true,
      message: "Password Reset successful. Please Sign-in",
      data: {
        userId : existingUsers[0].id,
      },
    }
  } catch (error: any) {
    return {
      error: error?.message,
    }
  }
}

export const resendEmailVerification = async (values: v.InferOutput<typeof ResetPasswordSchema>) => {
  

  try {

    const parsedResult = v.safeParse(ResetPasswordSchema, values);
    if(!parsedResult.success) throw new Error(parsedResult.issues.toLocaleString())

    const existingUsers = await db.select().from(userSchema).where(eq(userSchema.userEmail ,values.email ));
    if(!existingUsers[0] || existingUsers.length === 0) throw new Error( "Email isn't Not Registered , Please signUp");
    
    if(existingUsers[0].isVerified) throw new Error( "Email Already verified. Please Sign-in");

    const messageId =  await sendMail(existingUsers[0] , MailType["signUpVerify"])

    return {
      success: true,
      message: "We have sent a email verification link to your email.",
      data: {
        userId : existingUsers[0].id,
        messageId
      },
    }
  } catch (error: any ) {
    return {
      error: error?.message,
    }
  }
}



export const resetPassword = async (values:  v.InferOutput<typeof ResetPasswordSchema>) => {
  
  try {
    const parsedResult = v.safeParse(ResetPasswordSchema, values);
    if(!parsedResult.success) throw new Error(parsedResult.issues.toLocaleString())

    const existingUsers   = await db.select().from(userSchema).where(eq(userSchema.userEmail ,values.email ));
    if(!existingUsers[0] || existingUsers.length === 0) throw new Error( "Email isn't Not Registered , Please signUp");

    const messageId =  await sendMail(existingUsers[0], MailType["resetPass"])
    return {
      success: true,
      message: "Reset Password link is sent to your email.",
      data: {
        userId: existingUsers[0].id,
        messageId
      },
    }
  } catch (error: any) {
    return {
      error: error?.message,
    }
  }
}



export const signIn = async (values:  v.InferOutput<typeof SignInSchema>) => {
  try {
    const parsedResult = v.safeParse(SignInSchema, values);
    if(!parsedResult.success) throw new Error(parsedResult.issues.toLocaleString())

      const result = await db.select().from(userSchema).where(eq(userSchema.userEmail ,values.email ));
      const existingUser = result[0];
    
      if (!existingUser) {
        return {
          isEmailVerified: true,
          success: false,
          message: "User not found",
        }
      }
    
      if(!existingUser.isVerified){
        return {
          isEmailVerified: false,
          success: false,
          message: "User's email isn't verified.Please verify your email",
        }
      }

      const isPassed = await canLogedIn(existingUser.userEmail);
      
      if(!isPassed.canAttempt) {
        return {
            success: false,
            message:`"For security reasons, we limit the number of failed log-in attempts.  Please contact your website administrator for assitance with logging in.`,
            data: {
              nextAttemptTime : isPassed.nextAttemptTime
            },
          }
      }
      
    
      if (!existingUser.hashedPassword) {
        await recordFaildLoginAttempt(existingUser.userEmail);
        return {
          isEmailVerified: true,
          success: false,
          message: "User email or password doesn't match",
        }
      }
    
      const isValidPassword = await argon2.verify(
        existingUser.hashedPassword,
        values.password
      )
    
      if (!isValidPassword) {
        await recordFaildLoginAttempt(existingUser.userEmail);
        return {
          success: false,
          message: "Incorrect useremail or password",
        }
      }

      await removeFaildLoginAttempt(existingUser.userEmail);
      const session = await lucia.createSession(existingUser.id.toString(), {
          email: existingUser.userEmail,
          user_name: existingUser.userName
      });
      const sessionCookie = lucia.createSessionCookie(session.id);
    
        cookies().set(
        sessionCookie.name,
        sessionCookie.value,
        sessionCookie.attributes
      );
    
      return {
        success: true,
        message: "Login Successful!",
        data: {
          userId : existingUser.id 
        },
      }
  } catch (error: any ) {
    return {
      success: false,
      message: error.message,
    }
  }
}




export const signOut = async () => {
  try {
    const { session } = await validateRequest()

    if (!session) {
      return {
        error: "Unauthorized",
      }
    }

    await lucia.invalidateSession(session.id)

    const sessionCookie = lucia.createBlankSessionCookie()

    cookies().set(
      sessionCookie.name,
      sessionCookie.value,
      sessionCookie.attributes
    )
  } catch (error: any ) {
    return {
      error: error?.message,
    }
  }
}


