import EmployeeSignUpForm from "@/components/auth/signup/EmployeeSignUpForm"

export default async function EmpleSignUpPage() {

  return (
    <div>
      <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
          Create an Employee Account
      </h2>
      <EmployeeSignUpForm />
    </div>
  )
}