import { db } from "@root/dbConnect";
import { eq, desc } from "drizzle-orm";

import { failedLoginAttempts } from "@root/database/schema";


export const ATTEMPT_WINDOW = 1000 * Number(process.env.ATTEMPT_WINDOW_SEC);

export const canLogedIn = async (userEmail: string) => {

  const attempts = await db
    .select()
    .from(failedLoginAttempts)
    .where(
        eq(failedLoginAttempts.userEmail, userEmail)
    )
    .orderBy(desc(failedLoginAttempts.timeStamp)).limit(1);
    const attemptCount = attempts.length;
    if(attemptCount === 0) return ({ canAttempt: true });

    const nextAttemptTime = (new Date(attempts[0].timeStamp)).getTime() + ATTEMPT_WINDOW - Date.now();
    const nextAttemptDate = new Date( Date.now() + nextAttemptTime).toISOString();
    if (nextAttemptTime > 0)  return ({ canAttempt: false, nextAttemptTime  , nextAttemptDate});
    return ({ canAttempt: true });
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


