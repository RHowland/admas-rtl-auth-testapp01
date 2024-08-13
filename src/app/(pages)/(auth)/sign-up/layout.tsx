import { validateRequest } from "@/lib/service/lucia"
import Link from "next/link"
import { redirect } from "next/navigation"

export default async function Layout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  const { user } = await validateRequest()

  // section 1
  if (user) {
    return redirect("/")
  }

  return (
    <div className="pt:mt-0 mx-auto flex flex-col items-center justify-center px-6 pt-8 dark:bg-gray-900 md:h-screen">
      <div className="w-full max-w-xl space-y-8 rounded-lg bg-white p-6 shadow dark:bg-gray-800 sm:p-8">
          {children}
        <div className="flex gap-2">
        <p>Already have an account?</p>
        <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/sign-in">Sign-In Now</Link>
      </div>
      <div className="flex gap-2">
        <p>Resend Email Verification</p>
        <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/resend-verification">Resend E-verification</Link>
      </div>
      </div>
    </div>
  )
}
