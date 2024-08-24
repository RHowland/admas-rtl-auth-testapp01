"use server";

import * as v from "valibot";
import {
  CustomerSignUpSchema,
  EmployeeSignUpSchema,
} from "@root/src/valibot/SchemaTypes";

import * as argon2 from "argon2";
import { users as userSchema } from "@root/database/schema";
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";
import { MailType } from "@root/src/types";

import { formatDate } from "@/lib/utils";
import { favoriteQuestions } from "@root/src/types/constent/favoriteQuestions";
import { sendMail } from "@/lib/actions/sendMail";


export const customerSignUp = async (
  values: v.InferOutput<typeof CustomerSignUpSchema>
) => {
  try {
    const parsedResult = v.safeParse(CustomerSignUpSchema, values);
    if (!parsedResult.success)
      throw new Error(parsedResult.issues.toLocaleString());

    const hashedPassword = await argon2.hash(values.password);

    const existingUsers = await db
      .select()
      .from(userSchema)
      .where(eq(userSchema.userEmail, values.email));
    if (existingUsers[0] || existingUsers.length > 0) {
      return {
        error: "Email Already Registered",
      };
    }

    const storedUser = await db.insert(userSchema).values({
      userFirstName: values.firstName + values.lastName.slice(0,1).toLocaleUpperCase(),
      userLastName: values.lastName,
      userName: values.firstName + " " + values.lastName,
      userEmail: values.email,
      hashedPassword,
      updatedAt: formatDate(),
      userType: "prospect",
      isOtpUsed: "N",
      bypassRbacFlag: "N",
      softDeleteFlag: "N",
    }).returning();

    const messageId = await sendMail(storedUser[0], MailType["signUpVerify"]);

    return {
      success: true,
      message: "SignUp Successful! Please Verify Your Email.",
      data: {
        userId: storedUser[0].id,
        messageId,
      },
    };
  } catch (error: any) {
    return {
      error: error?.message,
    };
  }
};

export const employeeSignup = async (
  values: v.InferOutput<typeof EmployeeSignUpSchema>
) => {
  try {
    const parsedResult = v.safeParse(EmployeeSignUpSchema, values);
    if (!parsedResult.success)
      throw new Error(parsedResult.issues.toLocaleString());

    const hashedPassword = await argon2.hash(values.password);

    const existingUsers = await db
      .select()
      .from(userSchema)
      .where(eq(userSchema.userEmail, values.email));
    if (!existingUsers[0] || existingUsers.length == 0)
      throw new Error("No user found with this email");

    if(existingUsers[0].userType === "customer") throw new Error( "This is n't a employee email");
    if(existingUsers[0].isOtpUsed === "Y") throw new Error( "Otp already used");
    if(existingUsers[0].otp !== values.otp) throw new Error( "Invalid OTP");


    await db
      .update(userSchema)
      .set({
        hashedPassword,
        userType: "employee",
        isOtpUsed: "Y",
        isVerified: "Y",
        securityQuestion1: favoriteQuestions.security1.question,
        securityAnswer1: values.securityAnswer1,
        securityQuestion2: favoriteQuestions.security2.question,
        securityAnswer2: values.securityAnswer2,
        updatedAt: formatDate(),
      })
      .where(eq(userSchema.userEmail, values.email));

    return {
      success: true,
      message: "SignUp Successful! Please Login.",
      data: {
        userId: existingUsers[0].id,
      },
    };
  } catch (error: any) {
    return {
      success: false,
      message: error?.message,
    };
  }
};