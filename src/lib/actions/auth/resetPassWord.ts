"use server";

import * as v from "valibot";
import {
  ResetPasswordSchema,
} from "@root/src/valibot/SchemaTypes";

import { users as userSchema } from "@root/database/schema";
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";
import { MailType } from "@root/src/types";
import { sendMail } from "@/lib/actions/sendMail";






export const resetPassword = async (
  values: v.InferOutput<typeof ResetPasswordSchema>
) => {
  try {
    const parsedResult = v.safeParse(ResetPasswordSchema, values);
    if (!parsedResult.success)
      throw new Error(parsedResult.issues.toLocaleString());

    const existingUsers = await db
      .select()
      .from(userSchema)
      .where(eq(userSchema.userEmail, values.email));
    if (!existingUsers[0] || existingUsers.length === 0)
      throw new Error("Email isn't Not Registered , Please signUp");

    const messageId = await sendMail(existingUsers[0], MailType["resetPass"]);
    return {
      success: true,
      message: "Reset Password link is sent to your email.",
      data: {
        userId: existingUsers[0].id,
        messageId,
      },
    };
  } catch (error: any) {
    return {
      error: error?.message,
    };
  }
};