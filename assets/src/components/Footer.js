import React from 'react'
import {Link} from 'react-router-dom'
import '../App.css'

export default class extends React.Component {
  render() {
    return (
      <div className="container">

        <div className="horizontal_rule"/>

        <div className="footer">
          <Link to="/am_i_registered" className="footer__action">Am I registered?</Link>
          or
          <Link to="/register" className="footer__action">Register to Vote!</Link>
        </div>
      </div>
    );
  }
}
