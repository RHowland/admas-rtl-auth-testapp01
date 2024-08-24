

import {  validateRequest } from "@/lib/service/lucia"
import { redirect } from "next/navigation"
import Link from "next/link"
import { hasPermission } from "@root/src/lib/service/findPermission"
import SignOutBtn from "@root/src/components/auth/SignOutBtn"
import AuthCheckHelper from "@root/src/components/auth/AuthCheckHelper"


export default async function ProposalPage() {
  const { user } = await validateRequest()
  
  // section 1
  if(!user) {
    return (
      <AuthCheckHelper user={user} />
    )
  }
  const isPermitted = await hasPermission(user?.email , 'CanAccessProposalPage')
  if(!isPermitted){
    return (
      <main className="flex min-h-screen flex-col items-center p-24">
        <h1 className="font-bold">`You have not the permssion to access this page`</h1>
        <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/">Navigate to Home Page</Link>
      </main>
    )
  }

  // section 2
  return (
    <main className="flex min-h-screen flex-col items-center gap-2 justify-center p-24">
      <h1>pws-base-app01</h1>
      <div>
        <h2 className="text-2xl">Proposal Page</h2>
      </div>
      <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/">Navigate to Home Page</Link>
    </main>
  )
}


/**
 * ---------------------------------------------------------------------
 * File Name      : page.tsx
 * Component Name : Dashboard
 * Component Type : Next Page
 * Date Created   : 2024-06-24
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Question: Why was it necessary to create this component?
 * Answer  :  This component was necessary to provide a protected dashboard page that is accessible only to authenticated users, ensuring secure access to user-specific content and actions such as signing out. 
 *
 * ------------------------------
 * Question: What does this component do?:
 * Answer  : This component checks if a user is authenticated. If the user is not authenticated, it displays a message informing them that they do not have access and provides a link to the sign-in page. If the user is authenticated, it displays the user's information and provides a sign-out button.
 *
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Section 1:
 * Checks if a user is authenticated. If not, it renders a message and a link to the sign-in page.
 *  
 * Section 2:
 * Renders the authenticated user's information and provides a sign-out button.
 *
 *
 * ------------------------------
 * Input Comments:     (Enter "none" if you have no comments)
 * None
 * ------------------------------
 * Output Comments:    (Enter "none" if you have no comments)
 * None
 * ------------------------------
 * Additional Comments:
 * Question: Did you have to write any unusual code?
 * Answer  : NO.
 *
 */

