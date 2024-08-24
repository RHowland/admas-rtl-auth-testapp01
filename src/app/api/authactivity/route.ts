import { sessions as sessionSchema } from '@root/database/schema';
import { db } from '@root/dbConnect';
import AuthConfig from '@root/src/config_files/AuthConfig';
import { lucia, validateRequest } from '@root/src/lib/service/lucia'
import { eq } from 'drizzle-orm';
import { cookies } from 'next/headers';
import type { NextRequest } from 'next/server'
import { NextResponse } from 'next/server'


export async function GET(request: NextRequest) : Promise<Response> {
  try {
    const result = await validateRequest();
  if(result.session) {
    const [sessionReturn] = await db.select().from(sessionSchema).where(eq(sessionSchema.id , result.session.id ));
    const extendedTime = Math.round((Date.now() / 1000)) + AuthConfig.Max_Inactive_Seconds + AuthConfig.Waiting_Seconds;
    const [extendedSession] = await db.update(sessionSchema).set({expiresAt : extendedTime}).where(eq(sessionSchema.id , result.session.id )).returning();
    return NextResponse.json({ success: true , data: {user : result.user , sessionExpires : (new Date(extendedSession.expiresAt * 1000)).toISOString()} })
  }else {
    const blanksession = lucia.createBlankSessionCookie();
    cookies().set(
      blanksession.name,
      blanksession.value,
    )
    return NextResponse.json({ success: false , data: {user : null , sessionExpires : null}})
  }
  
  } catch (error) {
    const blanksession = lucia.createBlankSessionCookie();
    cookies().set(
      blanksession.name,
      blanksession.value,
    )
    return NextResponse.json({ success: false , data: {user : null , sessionExpires : null}})
  }
}