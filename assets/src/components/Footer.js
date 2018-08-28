import React from 'react'
import {Link} from 'react-router-dom'

export default () => <footer className="footer">
  <div className="conatiner">
    <nav className="footer__container">
      <a href="https://apps.idahovotes.gov/YourPollingPlace/AmIRegistered.aspx" className="footer__link">Am I registered?</a>
      or
      <a href="https://apps.idahovotes.gov/OnlineVoterRegistration" className="footer__link">Register to Vote!</a>
    </nav>
  </div>
</footer>
