import React, {Component} from 'react'

import Problem from './../components/Problem'
import Polling from './../components/Polling'
import Footer from './../components/Footer'

export default props => {
  const {
    location: {
      state: details
    }
  } = props
  // TODO(ts): Fetch precinct details if none are passed to the component.

  let Component = Polling

  if (details.message) {
    Component = Problem
  }

  return <React.Fragment>
    <Component {...details}/>
    <Footer />
  </React.Fragment>
}
