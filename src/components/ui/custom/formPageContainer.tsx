import  Container  from './container'
import React from 'react'

const FormPageContainer = ({children}) => {
  return (
    <Container>
      <div className="pt:mt-0 w-full flex justify-center px-6 pt-8 dark:bg-gray-900">
        <div className="lg:w-2/4 md:w-8/12 sm:w-11/12 space-y-8 rounded-lg bg-white p-6 shadow dark:bg-gray-800 sm:p-8">
          {children}
        </div>
      </div>
    </Container>
  )
}

export default FormPageContainer
