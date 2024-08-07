"use server";

import {  users as userSchema } from "@/lib/database/schema"
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";
export const optCheck = async (email : string, opt : string) => {
  
  try {
    const existingUsers   = await db.select().from(userSchema).where(eq(userSchema.userEmail , email));
    if(!existingUsers[0] || existingUsers.length === 0) throw new Error( "Email isn't Not Registered , Please signUp");

    if(existingUsers[0].otp !== opt) throw new Error( "Invalid OTP");

    return {
      success: true,
      message: "Otp validation passed.",
      data: {
        userId: existingUsers[0].id,
        email: existingUsers[0].userEmail
      },
    }
  } catch (error: any) {
    return {
      success: false,
      message: error?.message,
    }
  }
}