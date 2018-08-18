import React, {Component} from 'react'

import Polling from './../components/Polling'
import Footer from './../components/Footer'

export default props => {
  const {
    location: {
      state: details
    }
  } = props
  // TODO(ts): Fetch precinct details if none are passed to the component.

  return <React.Fragment>
    <Polling {...details}/>
    <Footer />
  </React.Fragment>
}
