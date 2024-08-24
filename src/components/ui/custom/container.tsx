import React from 'react'

const Container = ({children}) => {
  return (
    <div className="xl:max-w-7xl sm:w-screen mx-auto sm:px-6 lg:px-8" >
      {children}
    </div>
  )
}

export default Container
