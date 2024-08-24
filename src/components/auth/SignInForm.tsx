// Component Name : SignInForm
/* eslint-disable react/no-unescaped-entities */
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
import Link from "next/link"
import { useLoading } from "@/hooks/useLoading"
import Spinner from "@/components/Sppinner"
import { SignInSchema } from '@root/src/valibot/SchemaTypes';
import { useState } from 'react';
import FailedLoginModal from '../FailedLoginModal';
import { PasswordInput } from '../ui/custom/passwordInput';
import PasswordComplexity from '../PasswordComplexity';
import { signIn } from '@root/src/lib/actions/auth/signIn';
import { setUserInfo } from '@root/src/lib/client/getAndSetUserInfo';


export function SignInForm() {
  const {state : LoadingState , handleStateChange : handleLoadingState } = useLoading();
  const [nextLoginTime , setNextLoginTime] = useState(0);

  const form = useForm<v.InferOutput<typeof SignInSchema>>({
    resolver: valibotResolver(SignInSchema),
    mode : "onChange",
    defaultValues: {
      email: "",
      password: "",
    },
  })
  // Section 1 
  async function onSubmit(values: v.InferOutput<typeof SignInSchema>) {
    window.localStorage.setItem("forceSignOut", `false`);
    handleLoadingState({isLoading : true});
    const res = await signIn(values)
    if(res?.data?.nextAttemptTime){
      setNextLoginTime(() => Number(res.data.nextAttemptTime));
    }
    if (res.success) {
      toast({
        variant: "default",
        description: "Signed in successfully",
      });
      handleLoadingState({isLoading : false});
      setUserInfo(res.data?.user);
      return;
    }
    toast({
      variant: "destructive",
      description: res.message,
    })
    handleLoadingState({isLoading : false});
  }
  return (
    // Section 2 
    <Form {...form}>
      {nextLoginTime > 0 && ( <FailedLoginModal key={nextLoginTime} stateAction={setNextLoginTime}  nextAttemptTime={nextLoginTime}  />)}
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
        
     
          <Button  type="submit" disabled={LoadingState.isLoading || nextLoginTime > 0}>{LoadingState.isLoading ? <Spinner /> : "Submit"}</Button>
 
      </form>
      {/* Section 3 */}
      <div className="flex gap-2">
        <p> Don't have account?</p>
        <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/sign-up">Sign-Up Now</Link>
      </div>
      <div className="flex gap-2">
        <p>Forgot Password?</p>
        <Link className="text-blue-700  hover:bg-slate-200 rounded-md" href="/reset-password">Reset Password</Link>
      </div>
    </Form>
  )
}


/**
 * ---------------------------------------------------------------------
 * File Name      : SignInForm.tsx
 * Component Name : SignInForm
 * Component Type : Form
 * Date Created   : 2024-06-24
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Question: Why was it necessary to create this component?
 * Answer  : This component was necessary to provide a user interface for signing in, handling form validation, and managing authentication state in a user-friendly and efficient manner.
 *
 * ------------------------------
 * Question: What does this component do?:
 * Answer  :  This component renders a sign-in form that allows users to input their email and password. It validates the inputs using a schema, handles form submission, attempts to sign the user in, and provides feedback via toast notifications. If the sign-in is successful, it reloads the page; if not, it displays an error message.
 *
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)
 * Section 1:
 * Handles form submission, attempts user sign-in, and provides feedback based on the result.
 * 
 * Section 2:
 * Renders the form fields for email and password input, including validation and error messages.
 * 
 * Section 3:
 * Provides a link for users to navigate to the sign-up page if they don't have an account.
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