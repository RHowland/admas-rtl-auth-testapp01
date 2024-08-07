// Component Name : SignUpForm
"use client"

import * as v from 'valibot'
import { valibotResolver } from '@hookform/resolvers/valibot';
import { useForm } from "react-hook-form"
import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"

import { toast } from "@/components/ui/use-toast"
import { useRouter } from "next/navigation"
import { employeeSignup } from "@/lib/actions/auth.actions"
import Spinner from "@/components/Sppinner"
import { useLoading } from "@/hooks/useLoading"
import { useEffect, useState } from "react"
import { EmployeeSignUpSchema , EmailSchema } from '@root/src/valibot/SchemaTypes';
import { PasswordInput } from '@root/src/components/ui/passwordInput';
import PasswordComplexity from '@root/src/components/PasswordComplexity';
import { favoriteQuestions } from '@root/src/types/constent/favoriteQuestions';
import { optCheck } from '@root/src/lib/actions/otpCheck';
import { Label } from '@radix-ui/react-label';

export function EmployeeSignUpForm() {
  const {state : LoadingState , handleStateChange : handleLoadingState } = useLoading();
  const [isOtpPassed , setIsOtpPassed] = useState(false);
  const router = useRouter()

  const form = useForm<v.InferOutput<typeof EmployeeSignUpSchema>>({
    resolver: valibotResolver(EmployeeSignUpSchema),
    defaultValues: {
      email: "",
      password: "",
      otp: "",
      confirmPassword: "",
      securityAnswer1: "",
      securityAnswer2: ""
    },
  })


  async function otpVerification() {
    handleLoadingState({isLoading : true});
    const schemaCheck = await form.trigger("email") && await form.trigger("otp");
    if(!schemaCheck){
      handleLoadingState({isLoading : false});
      return;
    };

    const res = await optCheck( form.getValues("email") ,  form.getValues("otp"));
    if (res.success) {
      setIsOtpPassed(true);
      toast({
        variant: "default",
        description: res.message,
      })
      handleLoadingState({isLoading : false});
      return;
    }
    toast({
      variant: "destructive",
      description: res.message,
    });
    handleLoadingState({isLoading : false});
  }

  // section 1 
  async function onSubmit(values: v.InferOutput<typeof EmployeeSignUpSchema>) {
    handleLoadingState({isLoading : true});
    const res = await employeeSignup(values);
    if (res.success) {
      toast({
        variant: "default",
        description: res.message,
      })
      router.push(`/sign-in`);
      return;
    }
    toast({
      variant: "destructive",
      description: res.message,
    })
    handleLoadingState({isLoading : false});
  }
  
  useEffect(() => {
    return () => {
      handleLoadingState({isLoading : false});
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[])

  return (
    // section 2 
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-2">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input type="email" placeholder="example@example.com" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />{" "}

        {
          !isOtpPassed && (
            <>
              <FormField
                control={form.control}
                name="otp"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>One Time Password</FormLabel>
                    <FormControl>
                      <PasswordInput placeholder="****" type="password" {...field}/>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              <Button type="button" onClick={otpVerification} disabled={LoadingState.isLoading}>{LoadingState.isLoading ? <Spinner /> : "Verify OTP"}</Button>
            </>
          )
        }
        
        {isOtpPassed && (
          <div>
            <Label className="text-xl font-bold text-blue-600" >{`Please Answer the below's security Questions`}</Label>
            <FormField
              control={form.control}
              name="securityAnswer1"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{favoriteQuestions.security1.question}</FormLabel>
                  <FormControl>
                    <Input  placeholder={`Ex: ${favoriteQuestions.security1.example}`} {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="securityAnswer2"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{`Ex: ${favoriteQuestions.security2.question}`}</FormLabel>
                  <FormControl>
                    <Input  placeholder={favoriteQuestions.security2.example} {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="password"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Password</FormLabel>
                  <FormControl>
                    <PasswordInput placeholder="****" type="password" {...field}/>
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            {form.watch() && form.formState.dirtyFields.password && (
              <PasswordComplexity password={form.getValues('password')} />
            )}
            <FormField
              control={form.control}
              name="confirmPassword"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Confirm password</FormLabel>
                  <FormControl>
                    <PasswordInput placeholder="****" type="password" {...field}/>
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <Button type="submit" disabled={LoadingState.isLoading}>{LoadingState.isLoading ? <Spinner /> : "Submit"}</Button>
        </div>
        )}
      </form>
    </Form>
  )
}



/**
 * ---------------------------------------------------------------------
 * File Name      : SignUpForm.tsx
 * Component Name : SignUpForm
 * Component Type : Form
 * Date Created   : 2024-06-24
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Question: Why was it necessary to create this component?
 * Answer  : This component was necessary to provide a user interface for account registration, handling form validation, and managing the process of creating a new user account in a user-friendly and efficient manner.
 *
 * ------------------------------
 * Question: What does this component do?:
 * Answer  :  This component renders a sign-up form that allows users to input their name, email, password, and confirm their password. It validates the inputs using a schema, handles form submission, attempts to register the user, and provides feedback via toast notifications. If the sign-up is successful, it reloads the page; if not, it displays an error message.
 *
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Section 1:
 * Handles form submission, attempts user registration, and provides feedback based on the result.
 * 
 * Section 2:
 * Renders the form fields for name, email, password, and confirm password input, including validation and error messages.
 * 
 * Section 3:
 * Provides a link for users to navigate to the sign-in page if they already have an account.
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
