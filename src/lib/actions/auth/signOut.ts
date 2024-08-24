"use server";
import { lucia, validateRequest } from "@/lib/service/lucia";
import { cookies } from "next/headers";



export const signOut = async () => {
  try {
    const { session } = await validateRequest();

    if (!session) throw new Error("Unauthorized");

    await lucia.invalidateSession(session.id);

    const sessionCookie = lucia.createBlankSessionCookie();

    cookies().set(
      sessionCookie.name,
      sessionCookie.value,
      sessionCookie.attributes
    );
  } catch (error: any) {
    const sessionCookie = lucia.createBlankSessionCookie();

    cookies().set(
      sessionCookie.name,
      sessionCookie.value,
      sessionCookie.attributes
    );
  }
};