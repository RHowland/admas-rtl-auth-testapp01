"use client";
import { Dialog, DialogContent, DialogTitle } from "@radix-ui/react-dialog";
import AuthConfig from "@root/src/config_files/AuthConfig";
import { comparedTwoIsoDate } from "@root/src/lib/utils";
import { useEffect, useRef, useState } from "react";
import { DialogHeader } from "../ui/dialog";
import { Button } from "../ui/button";

const activityEvents = ["keydown", "scroll", "click"];
const timeToWait = AuthConfig.Max_Inactive_Seconds % 60 == 0 ? 1000 * 60 : 1000 * 1 ;

const AutoSignOut = ({ session }) => {
  const [sessionExpiredTime, setSessionExpiredTime] = useState(session.expiresAt);
  const [countDownTime, setCountDownTime] = useState(AuthConfig.Waiting_Seconds);
  const [countDown , setCountDown] = useState(false);
  const sessionExpiredTimeRef = useRef(sessionExpiredTime);
  const countDownTimeRef = useRef(countDownTime);
  const countDownRef = useRef(countDown);

  useEffect(()=>{
    sessionExpiredTimeRef.current = sessionExpiredTime;
    countDownTimeRef.current = countDownTime;
    countDownRef.current = countDown;
  },[countDown, countDownTime , sessionExpiredTime])

  const isActive = useRef(false);
  const inActivityTrackerRef = useRef<NodeJS.Timeout | null>(null);
  const countDownTrackerRef = useRef<NodeJS.Timeout | null>(null);




  useEffect(() => {
    const handleStorageChange = (event) => {
      if (event.key === "sessionExpiredTime" && event.newValue !== null) {
        setSessionExpiredTime(event.newValue);
        setCountDown(false);
        isActive.current = false;
      }
    };
    window.addEventListener("storage", handleStorageChange);

    return () => window.removeEventListener("storage", handleStorageChange);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);



  const apiAuthActivity = async () => {
    const apiCheck = await fetch("/api/authactivity");
    const apiCheckData = await apiCheck.json();
    if (apiCheckData.success && apiCheckData.data.sessionExpires !== null) {
      window.localStorage.setItem(
        "sessionExpiredTime",
        apiCheckData.data.sessionExpires
      );
      setSessionExpiredTime(apiCheckData.data.sessionExpires);
      setCountDown(false);
      isActive.current = false;
    }
  };

  useEffect(() => {
    inActivityTrackerRef.current = setInterval(() => {
      if(isActive.current && !countDownRef.current){

        (async () => {
          await apiAuthActivity();
        })();

      }else {
        const timeMillidiff = comparedTwoIsoDate(
          sessionExpiredTimeRef.current,
          (new Date()).toISOString()
        )

        if (timeMillidiff <= (AuthConfig.Waiting_Seconds) * 1000 && !countDownRef.current) {
          setCountDown(true);
          isActive.current = false;
        }
      }
    }, timeToWait);
    return () => {
      if (inActivityTrackerRef.current) {
        clearInterval(inActivityTrackerRef.current);
      }
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);



  useEffect(() => {
    if(countDownRef.current){
      countDownTrackerRef.current = setInterval(() => {
        const timeMillidiff = comparedTwoIsoDate(
          sessionExpiredTimeRef.current,
          (new Date()).toISOString()
        )
        setCountDownTime(timeMillidiff / 1000);
      }, 1000)
    }
    

    return () => {
      if(countDownTrackerRef.current) {
        clearInterval(countDownTrackerRef.current);
      }
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [countDown]);

  useEffect(() => {
    if (countDownTime <= 1 && countDownRef.current) {
      (async()=>{
        await fetch("/api/signout");
        window.location.reload();
      })()
      if(countDownTrackerRef.current) {
        clearInterval(countDownTrackerRef.current);
      }
      
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [countDownTime]);



  useEffect(() => {
    const eventHandeler = () => {
      if(!countDownRef.current){
        isActive.current = true;
      }
    };
    activityEvents.forEach((event) => {
      window.addEventListener(event, eventHandeler);
    });

    return () =>
      activityEvents.forEach((event) =>
        window.removeEventListener(event, eventHandeler)
      );
  }, []);

  return (
    <>
      {(countDown && countDownTime >= 0) && (
        <div className="fixed z-20 top-0 left-0 h-screen w-screen flex justify-center items-center bg-slate-800 bg-opacity-30 ">
          <div className="w-4/6 rounded-md box shadow-lg bg-slate-100 p-20">
            <Dialog key={`${countDown} + ${countDownTime}`} open={(countDown && countDownTime) >= 0}>
              {/* <Dialog open={true}> */}
              <DialogContent>
                <DialogHeader className="flex flex-col items-center gap-2">
                  <DialogTitle>
                    You have been inactive {(AuthConfig.Max_Inactive_Seconds / 60).toFixed(2)} minutes. For your security, you
                    will be automatically signed out in {AuthConfig.Waiting_Seconds} seconds unless you
                    choose to remain signed in
                  </DialogTitle>
                  <p className="text-center">
                    {" "}
                    Seconds remaining: { countDownTime >= AuthConfig.Waiting_Seconds ? AuthConfig.Waiting_Seconds : countDownTime.toFixed(0)}
                  </p>
                  <Button
                    type="button"
                    onClick={apiAuthActivity}
                    variant="default"
                  >
                    Remain Signed-In
                  </Button>
                </DialogHeader>
              </DialogContent>
            </Dialog>
          </div>
        </div>
      )}
    </>
  );
};

export default AutoSignOut;
