import { lucia, validateRequest } from "@root/src/lib/service/lucia";
import { cookies } from "next/headers";
import type { NextRequest } from "next/server";
import { NextResponse } from "next/server";

export async function GET(request: NextRequest): Promise<Response> {
  try {
    const result = await validateRequest();
    if (result.session) {
      lucia.invalidateSession(result.session.id);
    }
    const blanksession = lucia.createBlankSessionCookie();
    cookies().set(blanksession.name, blanksession.value);
    return NextResponse.json({ success: true, message: "Signed out" });
  } catch (error) {
    const blanksession = lucia.createBlankSessionCookie();
    cookies().set(blanksession.name, blanksession.value);
    return NextResponse.json({ success: true, message: "Signed out" });
  }
}
