// Component Name : SignUpForm
"use client";

import * as v from "valibot";
import { valibotResolver } from "@hookform/resolvers/valibot";
import { useForm } from "react-hook-form";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";

import { toast } from "@/components/ui/use-toast";
import { useRouter } from "next/navigation";
import { employeeSignup } from "@/lib/actions/auth/signUp";
import Spinner from "@/components/Sppinner";
import { useLoading } from "@/hooks/useLoading";
import { useEffect, useState } from "react";
import { EmployeeSignUpSchema } from "@root/src/valibot/SchemaTypes";
import { PasswordInput } from "@root/src/components/ui/custom/passwordInput";
import PasswordComplexity from "@root/src/components/PasswordComplexity";
import { favoriteQuestions } from "@root/src/types/constent/favoriteQuestions";
import { optCheck } from "@root/src/lib/actions/otpCheck";
import { Label } from "@radix-ui/react-label";


export default function EmployeeSignUpForm() {
  const { state: LoadingState, handleStateChange: handleLoadingState } =
    useLoading();
    const { state: otpCheckLoading, handleStateChange: handleOtpCheeckLoadingChange } =
    useLoading();
  
  const [otpEmailBlur , setOtpEmailBlur] = useState({
    email: false,
    otp: false,
  })

  useEffect(() => {
    if(otpEmailBlur.otp && otpEmailBlur.otp && !isOtpPassed){
      otpVerification();
      setOtpEmailBlur(prv => ({...prv , otp: false}));
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[otpEmailBlur])
  
  const [isOtpPassed, setIsOtpPassed] = useState<null | boolean>(false);
  const router = useRouter();

  const form = useForm<v.InferOutput<typeof EmployeeSignUpSchema>>({
    resolver: valibotResolver(EmployeeSignUpSchema),
    mode: 'onChange',
    defaultValues: {
      email: "",
      password: "",
      otp: "",
      confirmPassword: "",
      securityAnswer1: "",
      securityAnswer2: "",
    },
  });

  async function otpVerification() {
    handleOtpCheeckLoadingChange({ isLoading: true });
    const schemaCheck =
      (await form.trigger("email")) && (await form.trigger("otp"));
    if (!schemaCheck) {
      handleOtpCheeckLoadingChange({ isLoading: false });
      return;
    }

    const res = await optCheck(form.getValues("email"), form.getValues("otp"));
    if (res.success) {
      setIsOtpPassed(true);
      toast({
        variant: "default",
        description: res.message,
      });
      handleOtpCheeckLoadingChange({ isLoading: false });
      return;
    }
    toast({
      variant: "destructive",
      description: res.message,
    });

    if(res.issue === "email"){
      form.setError("email", { type: "custom", message: res.message });
    }
    if(res.issue === "Otp"){
      form.setError("otp", { type: "custom", message: res.message });
    }

    // form.
    handleOtpCheeckLoadingChange({ isLoading: false });
  }

  // section 1
  async function onSubmit(values: v.InferOutput<typeof EmployeeSignUpSchema>) {
    handleLoadingState({ isLoading: true });
    const res = await employeeSignup(values);
    if (res.success) {
      toast({
        variant: "default",
        description: res.message,
      });
      router.push(`/sign-in`);
      return;
    }
    toast({
      variant: "destructive",
      description: res.message,
    });
    handleLoadingState({ isLoading: false });
  }

  useEffect(() => {
    return () => {
      handleLoadingState({ isLoading: false });
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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
                <Input
                  type="email"
                  placeholder="example@example.com"
                  {...field}
                  onBlur={() => setOtpEmailBlur(prv => ({...prv , email : true}))}
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />{" "}
        <FormField
          control={form.control}
          name="otp"
          render={({ field }) => (
            <FormItem>
              <FormLabel>One Time Password</FormLabel>
              <FormControl>
                <PasswordInput 
                  placeholder="****"
                  type="password" 
                  {...field}
                  onBlur={() => setOtpEmailBlur(prv => ({...prv , otp : true}))}
                />
              </FormControl>
              <FormMessage />
              {otpCheckLoading.isLoading && (
                <div className="w-5 h-5">
                  <Spinner />
                </div>
              ) }
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
                    <PasswordInput
                      placeholder="****"
                      type="password"
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            {form.watch() && form.formState.dirtyFields.password && (
              <PasswordComplexity password={form.getValues("password")} />
            )}
            <FormField
              control={form.control}
              name="confirmPassword"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Confirm password</FormLabel>
                  <FormControl>
                    <PasswordInput
                      placeholder="****"
                      type="password"
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <h2 className="text-xl mt-20 font-bold text-blue-600">{`Security Questions:`}</h2>
            <FormField
              control={form.control}
              name="securityAnswer1"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>{`1. ${favoriteQuestions.security1.question}`}</FormLabel>
                  <FormControl>
                    <Input
                      placeholder={`Ex: ${favoriteQuestions.security1.example}`}
                      {...field}
                    />
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
                  <FormLabel>{`2. ${favoriteQuestions.security2.question}`}</FormLabel>
                  <FormControl>
                    <Input
                      placeholder={`Ex: ${favoriteQuestions.security2.example}`}
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <Button type="submit" disabled={LoadingState.isLoading || !isOtpPassed}>
              {LoadingState.isLoading ? <Spinner /> : "Submit"}
            </Button>
      </form>
    </Form>
  );
}
