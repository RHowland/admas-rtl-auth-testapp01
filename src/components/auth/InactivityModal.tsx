import { Dialog, DialogContent, DialogTitle } from "@radix-ui/react-dialog";
import React from "react";
import { DialogHeader } from "../ui/dialog";
import { Button } from "../ui/button";
import { useRouter } from "next/navigation";
import AuthConfig from "@root/src/config_files/AuthConfig";

const InactivityModal = ({stateAction}) => {
  const router = useRouter();
  const handleButton = () => {
    stateAction(false);
    window.localStorage.setItem("forceSignOut", `true`);
    router.push("/sign-in");
  }
  return (
    <div className="fixed z-20 top-0 left-0 h-screen w-screen flex justify-center items-center bg-slate-800 bg-opacity-30 ">
      <div className="w-4/6 rounded-md box shadow-lg bg-slate-100 p-20">
        <Dialog open={true}>
          {/* <Dialog open={true}> */}
          <DialogContent>
            <DialogHeader className="flex flex-col items-center gap-2">
              <DialogTitle className="text-center">
                You have been inactive for {(AuthConfig.Max_Inactive_Seconds / 60).toFixed(2)} minutes. For your security, you
                have been automatically signed out
              </DialogTitle>

              <Button type="button" onClick={handleButton} variant="default">
                Ok
              </Button>
            </DialogHeader>
          </DialogContent>
        </Dialog>
      </div>
    </div>
  );
};

export default InactivityModal;
