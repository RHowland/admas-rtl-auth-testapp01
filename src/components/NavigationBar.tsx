// Component Name : NavigationBar
"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";

import {
  NavigationMenu,
  NavigationMenuContent,
  NavigationMenuItem,
  NavigationMenuList,
  NavigationMenuTrigger,
} from "./ui/navigation-menu";
import Container from "@/components/ui/custom/container";
import { getUserInfo, setUserInfo } from "../lib/client/getAndSetUserInfo";
import SignOutBtn from "./auth/SignOutBtn";
import { useLogging } from "../providers/LoggingProvider";
import Spinner from "./Sppinner";
import InactivityModal from "./auth/InactivityModal";


const verticalMenu = [
  {
    name: "User Data",
    href: "/userDataPage",
  },
  {
    name: "Analytics",
    href: "/analyticsPage",
  },
  {
    name: "Content",
    href: "/contentPage",
  },
  {
    name: "Proposals",
    href: "/proposalPage",
  },
  {
    name: "Log Data",
    href: "/logDataPage",
  },
];


const NavigationBar = ({ user  }) => {
  const {loggingState, toggleLogging}  = useLogging();
  const [showInActivityModal , setShowInActivityModal] = useState(false);

  useEffect(() => {
    const localStoredUser = getUserInfo();
    // const isNull = localStoredUser === null || localStoredUser === `null` ? true :  false;
    const forceSignOut = window.localStorage.getItem("forceSignOut");
    if(user === null && forceSignOut !== `true`){
      console.log("Here in line 56");
      setShowInActivityModal(true);
    }

    if(localStoredUser !== JSON.stringify(user)){
      setUserInfo(user);
    }

    const handleStorageChange = (event) => {
      if(event.key === "userState") {
        window.location.reload();
      }
  }
    window.addEventListener('storage', handleStorageChange);

    return () => window.removeEventListener('storage', handleStorageChange );
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);


  return (
    <div>
      { showInActivityModal && <InactivityModal stateAction={setShowInActivityModal} />}
      
    <Container>
      <div className="flex flex-col lg:flex-row justify-between items-center py-5">
          <div>
            <Link  className="p-4 hover:bg-slate-200 rounded-md" href="/">
              HOME
            </Link>
          </div>
        <NavigationMenu>
          <NavigationMenuList className="flex flex-wrap flex-row-reverse sm:flex-row">
            <NavigationMenuItem className="relative">
              <NavigationMenuTrigger>
                <Link href={"/dashboardPage"} >
                  Dashboard
                </Link> 
                </NavigationMenuTrigger>
              <NavigationMenuContent className="bg-slate-100 flex flex-col">
                {verticalMenu.map((v, index) => (
                  <Link
                    key={v.name + index}
                    className=" hover:bg-slate-200 rounded-md min-w-32 p-4 flex justify-items-center items-center"
                    href={v.href}
                  >
                    {v.name}
                  </Link>
                ))}
              </NavigationMenuContent>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <Link  className="p-3 hover:bg-slate-200 rounded-md" href="/priceQuotePage">
                PriceQuote
              </Link>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <Link className="p-3 hover:bg-slate-200 rounded-md" href="/appointmentPage">
                Appointments
              </Link>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <span onClick={toggleLogging} className={`${loggingState !== undefined? "p-3" : ""} cursor-pointer    hover:bg-slate-200 rounded-md`}>
                {
                  loggingState === undefined ? 
                  <Spinner w={4} h={4} />
                  :
                    loggingState ? "DisableLogging" : "EnableLogging"
                }
                
              </span>
            </NavigationMenuItem>
          </NavigationMenuList>
        </NavigationMenu>

        <NavigationMenu>
        {!user && (
          <NavigationMenuList className="flex flex-wrap">
            <NavigationMenuItem>
              <Link
                className="p-3 hover:bg-slate-200 rounded-md"
                href="/sign-in"
              >
                sign-in
              </Link>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <Link
                className="p-3 hover:bg-slate-200 rounded-md"
                href="/sign-up"
              >
                sign-up
              </Link>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <Link
                className="p-3 hover:bg-slate-200 rounded-md"
                href="/sign-up/empl"
              >
                empl-sign-Up
              </Link>
            </NavigationMenuItem>
          </NavigationMenuList>
        )}

        {user && (
          <NavigationMenuList>
            <NavigationMenuItem>
              <p>{user.name}</p>
            </NavigationMenuItem>
            <NavigationMenuItem>
              <SignOutBtn />
            </NavigationMenuItem>
          </NavigationMenuList>
        )}
        </NavigationMenu>
      </div>
    </Container>
    </div>
  );
};

export default NavigationBar;

/**
 * ---------------------------------------------------------------------
 * File Name      : NavigationBar.tsx
 * Component Name : NavigationBar
 * Component Type : Navbar
 * Date Created   : 2024-06-24
 * Dev Initials   : Elias Emon
 * ------------------------------
 * Question: Why was it necessary to create this component?
 * Answer  : This component was necessary to provide a navigation bar that dynamically adjusts its content based on the user's authentication state, offering navigation options and actions that are appropriate for both authenticated and unauthenticated users.
 *
 * ------------------------------
 * Question: What does this component do?:
 * Answer  : This component renders a navigation bar with links to different pages. If the user is not authenticated, it displays links to the home, sign-in, and sign-up pages. If the user is authenticated, it shows links to the home and dashboard pages, as well as a button to sign out.
 *
 * ------------------------------
 * Section Comments:   (Enter "none" if you have no comments)

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
