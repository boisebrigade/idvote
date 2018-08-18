import React, {Component} from 'react'

import Footer from './../components/Footer'

export default props => {
  const {
    location: {
      state: {
        message = "Currently having problems, try again later"
      }
    }
  } = props

  return <React.Fragment>
    <h1>{message}</h1>
    <Footer />
  </React.Fragment>
}
