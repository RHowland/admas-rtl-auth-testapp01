import React, { useState, useEffect } from 'react';

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Button } from './ui/button';


const CountdownTimer = ({ nextAttemptTime , stateAction }) => {
  const calculateTimeLeft = (leftTime : number) => {
    const difference = leftTime - 1000;
    if (difference > 0) {
      const timeLeft = {
        hours: Math.floor((difference / (1000 * 60 * 60)) % 24),
        minutes: Math.floor((difference / 1000 / 60) % 60),
        seconds: Math.floor((difference / 1000) % 60),
      };
      return {
        success: false,
        leftTime : difference,
        message: `Please Try to Login After ${timeLeft.hours > 0 ? `${timeLeft.hours} hours` : ''} : ${timeLeft.minutes ? `${timeLeft.minutes} minutes` : '' } ${timeLeft.seconds} seconds `
      } 
    }

    return {
      success: true,
      leftTime : difference,
      message: `You can Login Now`
    };
  };

  const [timeLeft, setTimeLeft] = useState({
    success: false,
    leftTime : nextAttemptTime,
    message: ""
  });

  const [dailogState , setDailogStare] = useState(true);

  const handleOpenChange = () => {
    setDailogStare(!dailogState)
  }

    useEffect(() => {
      if(timeLeft.leftTime <= 0) stateAction(0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
    },[timeLeft.leftTime]);
    
    useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft( (prv) => {
        const refineTimeLeft = calculateTimeLeft(prv.leftTime);
        return {...refineTimeLeft }
      })
      
    }, 1000);
    return () => clearInterval(timer);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[]);

  return (

    <Dialog open={dailogState} onOpenChange={handleOpenChange}>
      <DialogContent>
        <DialogHeader className='flex flex-col items-center gap-2'>
          <DialogTitle>Processing Occurring,</DialogTitle>
          <DialogDescription>
            {
              timeLeft.success? timeLeft.message : (
                `Please wait for ${timeLeft.message}`
              )
            }
          </DialogDescription>
          <Button type="button" onClick={handleOpenChange} variant="default">
              OK
            </Button>
        </DialogHeader>
            
      </DialogContent>
    </Dialog>



    // <div className={`${timeLeft.success? 'text-green-500 ' : 'text-red-500 '}text-xl font-bold`}>
    //   {timeLeft.message}
    // </div>
  );
};

export default CountdownTimer;
