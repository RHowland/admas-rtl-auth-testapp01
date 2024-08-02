import React, { useState, useEffect } from 'react';

const CountdownTimer = ({ nextAttemptTime }) => {
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

  const [timeLeft, setTimeLeft] = useState(calculateTimeLeft(Number(nextAttemptTime)));

  useEffect(() => {

    if(timeLeft.success) return;

    const timer = setInterval(() => {
      setTimeLeft( (prv) => {
        const refineTimeLeft = calculateTimeLeft(prv.leftTime);
        console.log(refineTimeLeft);
        return {...refineTimeLeft }
      })
      
    }, 1000);

    return () => clearInterval(timer);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[]);

  return (
    <div className={`${timeLeft.success? 'text-green-500 ' : 'text-red-500 '}text-xl font-bold`}>
      {timeLeft.message}
    </div>
  );
};

export default CountdownTimer;
