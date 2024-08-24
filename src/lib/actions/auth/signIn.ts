"use server";

import * as v from "valibot";
import {
  SignInSchema,
} from "@root/src/valibot/SchemaTypes";
import { lucia } from "@/lib/service/lucia";
import { cookies } from "next/headers";
import * as argon2 from "argon2";
import { users as userSchema } from "@root/database/schema";
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";
import {
  ATTEMPT_WINDOW,
  canLogedIn,
  recordFailedLoginAttempt,
  removeFaildLoginAttempt,
} from "../loginAttempts";

export const signIn = async (values: v.InferOutput<typeof SignInSchema>) => {
  try {
    const parsedResult = v.safeParse(SignInSchema, values);
    if (!parsedResult.success)
      throw new Error(parsedResult.issues.toLocaleString());

    const result = await db
      .select()
      .from(userSchema)
      .where(eq(userSchema.userEmail, values.email));
    const existingUser = result[0];

    if (!existingUser) throw new Error('User not found');
    if (existingUser.isVerified === "N") throw new Error("User's email isn't verified. Please verify your email");

    // checking the user already loged in or not
    const sessions = await lucia.getUserSessions(existingUser.id.toString());
    if (sessions.length > 0){
      await recordFailedLoginAttempt(existingUser.userEmail, "Error G23 has occurred.");
      throw new Error("Cannot Log In at This Time. Error G23 has occurred.");
    }

    
    const isPassed = await canLogedIn(existingUser.userEmail);
    if (!isPassed.canAttempt) {
      return {
        success: false,
        message: `For security reasons, we limit the number of failed log-in attempts.  Please contact your website administrator for assitance with logging in.`,
        data: {
          nextAttemptTime: isPassed.nextAttemptTime,
        },
      };
    }

    if (!existingUser.hashedPassword) {
      await recordFailedLoginAttempt(existingUser.userEmail , "User email or password doesn't match");
      throw new Error("User email or password doesn't match");
    }

    const isValidPassword = await argon2.verify(
      existingUser.hashedPassword,
      values.password
    );

    if (!isValidPassword) {
      await recordFailedLoginAttempt(existingUser.userEmail , "User email or password doesn't match");
      throw new Error( "User email or password doesn't match");
    }

    await removeFaildLoginAttempt(existingUser.userEmail);

    const session = await lucia.createSession(existingUser.id.toString(), {
      email: existingUser.userEmail,
      user_name: existingUser.userName,
    });

    const sessionCookie = lucia.createSessionCookie(session.id);

    // console.log( "sessionCokkie values" + JSON.stringify(sessionCookie.attributes.));
    

    cookies().set(
      sessionCookie.name,
      sessionCookie.value,
      // sessionCookie.attributes
    );
    const { user  } = await lucia.validateSession(session.id);
    return {
      success: true,
      message: "Login Successful!",
      data: {
        user
      },
    };
  } catch (error: any) {
    return {
      success: false,
      message: error.message,
      data: {
        nextAttemptTime: ATTEMPT_WINDOW,
      },
    };
  }
};