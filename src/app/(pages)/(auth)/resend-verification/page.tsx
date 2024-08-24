import { validateRequest } from "@/lib/service/lucia";
import { ResendEmailVerificationFrom } from "@root/src/components/auth/ResendEmailVerificationForm";
import FormPageContainer from "@root/src/components/ui/custom/formPageContainer";

import { redirect } from "next/navigation";

export default async function ResendEmailVerification() {
  const { user } = await validateRequest();
  // section 1
  if (user) {
    return redirect("/");
  }
  // section 2
  return (
    <FormPageContainer>
      <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
        Place Your Registered Email Address for Email-verification
      </h2>
      {/* section 3  */}
      <ResendEmailVerificationFrom />
    </FormPageContainer>
  );
}

/**
 * ---------------------------------------------------------------------
 * File Name      : ResendEmailVerification.tsx
 * Component Name : ResendEmailVerification
 * Component Type : Page Component
 * Date Created   : 2024-07-01
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Purpose:
 * This component renders the ResendEmailVerificationForm for users to resend email verification links. It checks if the user is already authenticated and redirects to the homepage if they are.
 * ------------------------------
 * Input Comments:     (Enter "none" if you have no comments)
 * None
 * ------------------------------
 * Output Comments:    (Enter "none" if you have no comments)
 * None
 * ------------------------------
 * Additional Comments:
 * - The component uses the validateRequest function to check if the user is authenticated.
 * - If the user is authenticated, they are redirected to the homepage.
 * - If the user is not authenticated, the ResendEmailVerificationForm component is rendered to resend email verification.
 * Question: Did you have to write any unusual code?
 * Answer  : NO.
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Section 1:
 * - Checks if the user is authenticated. If so, redirects to the homepage.
 * Section 2:
 * - Renders the ResendEmailVerificationForm component if the user is not authenticated.
 * ------------------------------
 */
