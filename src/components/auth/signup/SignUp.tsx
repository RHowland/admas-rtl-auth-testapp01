import React from 'react'
import { EmployeeSignUpForm } from './employeeSignup/EmployeeSignUpForm'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../../ui/tabs'
import { CustomerSignUpForm } from '@/components/auth/signup/customerSignup/CustomerSignUpForm'

export default function SignUp() {
  return (
    <div>
      {/* 
       */}
      <Tabs defaultValue="userSignup">
        <TabsList className="grid w-full grid-cols-2">
          <TabsTrigger value="userSignup">Customer</TabsTrigger>
          <TabsTrigger value="employeeSignup">Employee</TabsTrigger>
        </TabsList>
        <TabsContent value="userSignup">
          <CustomerSignUpForm />
        </TabsContent>
        <TabsContent value="employeeSignup">
          <EmployeeSignUpForm />
        </TabsContent>
      </Tabs>

    </div>
  )
}
