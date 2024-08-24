import type { NextRequest } from 'next/server'
import { NextResponse } from 'next/server'

import { cleanupExpiredFailedLoginAttempts, cleanupExpiredVerificationTokens } from "@root/src/lib/service/crons";

export async function GET(request: NextRequest) : Promise<Response> {
  cleanupExpiredVerificationTokens();
  cleanupExpiredFailedLoginAttempts();
  return NextResponse.json({ success: true , message: 'cron-job started' })
}