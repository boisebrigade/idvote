import React from 'react';
import { Row, Button } from 'react-bootstrap';
import './App.css';
export default class extends React.Component {

  render() {
    return (
      <div>
        <div className="dividerline"></div>
        <div className="footer"></div>
        <Row className="lowerButtons">
          <Button>Am I registered?</Button>
          or
          <Button>Register to Vote!</Button>
          or
          <Button>Register to Vote!</Button>
        </Row>
      </div>
    );
  }
}
