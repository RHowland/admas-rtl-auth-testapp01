import { db } from "@root/dbConnect";
import { eq, and, gte, asc } from "drizzle-orm";

import { failedLoginAttempts } from "@/lib/database/schema";

const MAX_ATTEMPTS = Number(process.env.MAX_ATTEMPTS);
const ATTEMPT_WINDOW =
  60 * 60 * 1000 * Number(process.env.ATTEMPT_WINDOW_HOURS);

export const canLogedIn = async (userEmail: string) => {
  const attemptHoursAgo = new Date(Date.now() - ATTEMPT_WINDOW);
  const strAtHours = attemptHoursAgo.toISOString();
  const attempts = await db
    .select()
    .from(failedLoginAttempts)
    .where(
      and(
        eq(failedLoginAttempts.userEmail, userEmail),
        gte(failedLoginAttempts.timeStamp, strAtHours)
      )
    )
    .orderBy(asc(failedLoginAttempts.timeStamp));
  const attemptCount = attempts.length;

  if (attemptCount < MAX_ATTEMPTS) {
    return { canAttempt: true };
  } else {
    const firstAttemptTime = new Date(attempts[0].timeStamp);
    const nextAttemptTime = firstAttemptTime.getTime() + ATTEMPT_WINDOW - Date.now();
    return { canAttempt: false, nextAttemptTime };
  }
};

export const recordFaildLoginAttempt = async (userEmail: string) => {
  const insertData = {
    userEmail: userEmail,
    timeStamp: (new Date()).toISOString(),
  };
  const result = await db
    .insert(failedLoginAttempts)
    .values(insertData)
    .returning();
  return result[0];
};

export const removeFaildLoginAttempt = async (userEmail: string) => {
  await db
    .delete(failedLoginAttempts)
    .where(eq(failedLoginAttempts.userEmail, userEmail))
    .returning();
};


