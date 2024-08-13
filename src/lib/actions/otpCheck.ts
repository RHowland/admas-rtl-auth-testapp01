"use server";

import {  users as userSchema } from "@root/database/schema"
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";

export type IIssue = "email" | "Otp"
class OtpError extends Error {
  issue : IIssue;
  constructor(message : string, issue : IIssue) {
    super(message);
    this.issue = issue;
    Object.setPrototypeOf(this, OtpError.prototype);
  }
}

export const optCheck = async (email : string, otp : string) => {
  
  try {
    const existingUsers   = await db.select().from(userSchema).where(eq(userSchema.userEmail , email));
    if(!existingUsers[0] || existingUsers.length === 0) throw new OtpError( "Email isn't Not Registered , Please signUp" , "email");

    if(existingUsers[0].userType === "customer") throw new OtpError( "This is n't a employee email" , "email");
    if(existingUsers[0].isOtpUsed === "Y") throw new OtpError( "Otp already used" , "Otp");
    if(existingUsers[0].otp !== otp) throw new OtpError( "Invalid OTP" , "Otp");

    return {
      success: true,
      message: "Otp validation passed.",
      data: {
        userId: existingUsers[0].id,
        email: existingUsers[0].userEmail
      },
    }
  } catch (error : any) {
    return {
      success: false,
      issue: error.issue,
      message: error?.message,
    }
  }
}