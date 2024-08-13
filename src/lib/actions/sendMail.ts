"use server";
import { InferSelectModel } from "drizzle-orm";

import { users as userSchema } from "@root/database/schema";
import { MailType } from "@root/src/types";
import { storeToken } from "./storeToken";
import { generateMailReact, sendMailTask } from "@/lib/service/mail-service";


export const sendMail = async (
  user: InferSelectModel<typeof userSchema>,
  mailtype: MailType
) => {
  const userId = user.id;
  const userName = user.userName ?? "Mr.";
  const userEmail = user.userEmail;

  const { token, expiresHours } = await storeToken({ type: mailtype, userId });

  const verificationLink = `${process.env.NEXT_PUBLIC_BASE_URL}/verify-token?token=${token}&type=${mailtype}`;

  const mailReact = generateMailReact({
    userName,
    tokenUrl: verificationLink,
    token,
    type: mailtype,
    expiresTime: `${expiresHours} Hours`,
  });

  const { id: messageId } = await sendMailTask({
    type: mailtype,
    react: mailReact,
    targetMail: userEmail,
    subject: "Email Verifications",
  });

  return messageId;
};