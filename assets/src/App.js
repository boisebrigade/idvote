import React, { Component } from 'react';
import logo from './logo.png';
import './App.css';

import Form from './Form';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to IDVotes!</h1>
        </header>
        <p className="App-intro">
          Enter your address to find where you vote.
        </p>
        <Form />
      </div>
    );
  }
}

export default App;
