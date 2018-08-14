import React from 'react';
import { Nav, NavItem } from 'react-bootstrap';
import './App.css';
export default class extends React.Component {
  constructor(props, context) {
    super(props, context);

    this.state = {
      open: true
    };
  }

  render() {
    return (
      <header className="header container">
        <Nav bsStyle="pills" pullLeft>
          <NavItem eventKey={1} title="Item">
            Home
          </NavItem>
          <NavItem eventKey={1} title="Item">
            Nav Item 1
          </NavItem>
          <NavItem eventKey={2} title="Item">
            Nav Item 2
          </NavItem>
          <NavItem eventKey={3} title="Item">
            Nav Item 3
          </NavItem>
        </Nav>
      </header>
    );
  }
}
