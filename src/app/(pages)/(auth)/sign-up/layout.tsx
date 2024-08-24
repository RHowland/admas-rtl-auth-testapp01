import { validateRequest } from "@/lib/service/lucia";
import FormPageContainer from "@root/src/components/ui/custom/formPageContainer";
import Link from "next/link";
import { redirect } from "next/navigation";

export default async function Layout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const { user } = await validateRequest();

  // section 1
  if (user) {
    return redirect("/");
  }

  return (
    <FormPageContainer>
      {children}
      <div className="flex gap-2">
        <p>Already have an account?</p>
        <Link
          className="text-blue-700  hover:bg-slate-200 rounded-md"
          href="/sign-in"
        >
          Sign-In Now
        </Link>
      </div>
      <div className="flex gap-2">
        <p>Resend Email Verification</p>
        <Link
          className="text-blue-700  hover:bg-slate-200 rounded-md"
          href="/resend-verification"
        >
          Resend E-verification
        </Link>
      </div>
    </FormPageContainer>
  );
}
