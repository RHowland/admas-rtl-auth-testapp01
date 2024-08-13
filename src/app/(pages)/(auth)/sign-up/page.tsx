// Component Name : SignUpPage

import CustomerSignUpForm from "@root/src/components/auth/signup/CustomerSignUpForm"
export default async function SignUpPage() {
  return (
    <div>
        <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
          Create an Account
        </h2>
        <CustomerSignUpForm />
    </div>
  )
}


/**
 * ---------------------------------------------------------------------
 * File Name      : page.tsx
 * Component Name : SignUpPage
 * Component Type : Next Page
 * Date Created   : 2024-06-24
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Question: Why was it necessary to create this component?
 * Answer  :  This component was necessary to provide a dedicated page for user registration. It ensures that authenticated users are redirected to the home page and displays the sign-up form for new users, facilitating account creation.
 *
 * ------------------------------
 * Question: What does this component do?:
 * Answer  : This component checks if a user is already authenticated. If the user is authenticated, it redirects them to the home page. If the user is not authenticated, it renders a page with a sign-up form, allowing new users to create an account
 *
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Section 1:
 * Checks if a user is authenticated and redirects them to the home page if they are.
 *
 * Section 2:
 * Renders the sign-up form for new users to create an account.
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
