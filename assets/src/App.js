import React, { Component } from 'react';

import './App.css';
import Form from './Form';
import UpperNav from './UpperNav';
import LowerNav from './LowerNav';

class App extends Component {
  render() {
    return (
      <div className="App">
        <UpperNav />
        <Form />
        <LowerNav />
      </div>
    );
  }
}

export default App;
