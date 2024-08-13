'use client';

import { createContext, useContext, useState, ReactNode, useEffect } from 'react';

type LoggingState = boolean | undefined;

interface LoggingContextProps {
  loggingState: LoggingState;
  toggleLogging: () => void;
}

const LoggingContext = createContext<LoggingContextProps | undefined>(undefined);

export const LoggingProvider = ({ children }: { children: ReactNode }) => {
  const [loggingState, setLoggingState] = useState<LoggingState>(undefined);

  const toggleLogging = () => {
    setLoggingState((prevState) =>{
      const newState = (prevState === true ? false : true)
      window.localStorage.setItem('logging', JSON.stringify(newState))
      return newState;
    });
  };

  useEffect(() => {
    const logging = window.localStorage.getItem('logging');
    if(logging === null) {
      window.localStorage.setItem('logging', JSON.stringify(false))
      setLoggingState(false);
    }else{
      setLoggingState(JSON.parse(logging))
    }
    
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[])

  return (
    <LoggingContext.Provider value={{ loggingState, toggleLogging }}>
      {children}
    </LoggingContext.Provider>
  );
};

export const useLogging = () => {
  const context = useContext(LoggingContext);
  if (context === undefined) {
    throw new Error('useLogging must be used within a LoggingProvider');
  }
  return context;
};