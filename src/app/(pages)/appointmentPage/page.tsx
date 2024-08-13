

import {  validateRequest } from "@/lib/service/lucia"
import { redirect } from "next/navigation"
import Link from "next/link"
import { hasPermission } from "@root/src/lib/service/findPermission"


export default async function AppointmentPage() {
  const { user } = await validateRequest()
  
  // section 1
  if(!user) {
    return redirect("/sign-in")
  }
  // const isPermitted = await hasPermission(user?.email , '')
  // if(!isPermitted){
  //   return (
  //     <main className="flex min-h-screen flex-col items-center p-24">
  //       <h1 className="font-bold">`You have not the permssion to access this page`</h1>
  //       <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/">Navigate to Home Page</Link>
  //     </main>
  //   )
  // }

  // section 2
  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-2 p-24">
      <h1>pws-base-app01</h1>
      <div>
        <h2 className="text-2xl">Appointment Page</h2>
      </div>
      <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/">Navigate to Home Page</Link>
    </main>
  )
}


