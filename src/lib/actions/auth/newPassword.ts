"use server";

import * as v from "valibot";
import {
  NewPasswordSchema,
} from "@root/src/valibot/SchemaTypes";
import * as argon2 from "argon2";
import { users as userSchema } from "@root/database/schema";
import { db } from "@root/dbConnect";
import { eq } from "drizzle-orm";
import { verifyToken } from "@/lib/actions/verifyToken";
import { formatDate } from "@/lib/utils";




export const newPassword = async (
  values: v.InferOutput<typeof NewPasswordSchema>,
  token: string
) => {
  const tokenResult = await verifyToken(token, "newPassword");
  if (!tokenResult.success) {
    return {
      error: "Reset Password Token isn't valid",
    };
  }

  try {
    const existingUsers = await db
      .select()
      .from(userSchema)
      .where(eq(userSchema.id, tokenResult.data.userId));
    if (!existingUsers[0] || existingUsers.length === 0) {
      return {
        error: "User isn't registered yet. Please SignUp",
      };
    }
    const hashedPassword = await argon2.hash(values.password);
    await db
      .update(userSchema)
      .set({ hashedPassword, updatedAt: formatDate() })
      .where(eq(userSchema.id, existingUsers[0].id))
      .returning();

    return {
      success: true,
      message: "Password Reset successful. Please Sign-in",
      data: {
        userId: existingUsers[0].id,
      },
    };
  } catch (error: any) {
    return {
      error: error?.message,
    };
  }
};