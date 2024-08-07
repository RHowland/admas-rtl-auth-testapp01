import { db } from "@root/dbConnect";
import { eq, asc } from "drizzle-orm";

import { failedLoginAttempts } from "@/lib/database/schema";


const ATTEMPT_WINDOW_INCREMENT = 1000 * Number(process.env.ATTEMPT_WINDOW_SEC);

export const canLogedIn = async (userEmail: string) => {
  
  const attempts = await db
    .select()
    .from(failedLoginAttempts)
    .where(
        eq(failedLoginAttempts.userEmail, userEmail)
    )
    .orderBy(asc(failedLoginAttempts.timeStamp));
    const attemptCount = attempts.length;

    if(attemptCount == 0) return ({ canAttempt: true });
  
  const blockedSec = attemptCount == 1 ? 10 * 1000 : (attemptCount - 1)  * ATTEMPT_WINDOW_INCREMENT;

  const blockedInRealTime = (new Date(attempts[attemptCount - 1].timeStamp)).getTime() + blockedSec;
  
  if (blockedInRealTime < Date.now()) {
    return { canAttempt: true };
  } else {
    const nextAttemptTime = blockedInRealTime -  Date.now();
    return { canAttempt: false, nextAttemptTime };
  }
};

export const recordFailedLoginAttempt = async (userEmail: string , reason : string) => {
  const insertData = {
    userEmail: userEmail,
    reason,
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


