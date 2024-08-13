import { db } from "@root/dbConnect";
import { failedLoginAttempts, verificationTokens } from "@root/database/schema";
import { lt } from "drizzle-orm";

export const cleanupExpiredVerificationTokens = async () => {
  console.log("Cron Job Start for the Expired verification tokens.");
  const currentTime = Date.now();
  await db
    .delete(verificationTokens)
    .where(lt(verificationTokens.expiresAt, currentTime));

  console.log("Expired verification tokens cleaned up.");
};

export const cleanupExpiredFailedLoginAttempts = async () => {
  console.log("Cron Job Start for the Expired failed login attempts.");
  const currentTime = Date.now();
  const twoHoursAgoIsoDate = new Date(
    currentTime - 2 * 60 * 60 * 1000
  ).toISOString(); // 2 hours in milliseconds

  await db
    .delete(failedLoginAttempts)
    .where(lt(failedLoginAttempts.timeStamp, twoHoursAgoIsoDate));

  console.log("Expired failed login attempts cleaned up.");
};
