'use client';

import { useEffect } from 'react'

const AuthCheckHelper = ({user}) => {

  useEffect(()=> {
    if(!user){
      window.location.replace("/sign-in");
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  },[])
  return (
    <div>
      
    </div>
  )
}

export default AuthCheckHelper
