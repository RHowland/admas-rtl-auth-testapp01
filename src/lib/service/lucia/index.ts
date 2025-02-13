
//lib.auth.ts
import { BetterSqlite3Adapter } from "@lucia-auth/adapter-sqlite";
import { Lucia, TimeSpan } from 'lucia';
import { cookies } from 'next/headers';
import { cache } from 'react';
import type { Session, User } from 'lucia';
import { sqliteDatabase } from "@root/dbConnect";
import AuthConfig from "@root/src/config_files/AuthConfig";


/** adapter: Uses the previously defined SQLite adapter.
      sessionCookie: Configures the session cookie attributes. The secure attribute is set based on the environment (production or development).
      getUserAttributes: Function to map database user attributes to user object attributes used in the application.
*/

const adapter = new BetterSqlite3Adapter(sqliteDatabase, {
  user: 'users',
  session: 'sessions',
})



export const lucia = new Lucia(adapter, {
  sessionExpiresIn: new TimeSpan(AuthConfig.Max_Inactive_Seconds + AuthConfig.Waiting_Seconds, "s"),
  sessionCookie: {
    
    attributes: {
      secure: process.env.NODE_ENV === 'production',
    },
  },
  getUserAttributes: (attributes: any) => {
    return {
      firstName: attributes.user_first_name,
      name: attributes.user_name,
      email : attributes.user_email,
    };
  },
});

/** cache: Caches the result of the validation function to optimize performance.
validateRequest: This function validates the session ID from the cookies.
    1.If no session ID is found, it returns user and session as null.
    2.If a session ID is found, it attempts to validate the session.
    3.If the session is fresh, it refreshes the session cookie.
    4.If the session is not valid, it creates a blank session cookie.
 */

export const validateRequest = cache(
  async (): Promise<
    { user: User; session: Session } | { user: null; session: null }
  > => {
    const sessionId = cookies().get(lucia.sessionCookieName)?.value ?? null;
    if (!sessionId) {
      return {
        user: null,
        session: null,
      };
    }
    try {
      const result = await lucia.validateSession(sessionId);
      return result;
    } catch(error) {
      return { user: null, session: null };
    }
  }
);

/** Module Augmentation: Extends the lucia module to include the Lucia instance and the database user attributes interface.
DatabaseUserAttributes: Defines the structure of user attributes stored in the database, including email and name. The role attribute is commented out but can be included if needed.
*/
declare module 'lucia' {
  interface Register {
    Lucia: typeof lucia;
    DatabaseUserAttributes: DatabaseUserAttributes;
  }
}

export interface DatabaseUserAttributes {
	user_email: string;
  user_name: string;
  user_first_name: string;
}

