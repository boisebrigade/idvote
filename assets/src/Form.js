import React from 'react';
import { Button } from 'react-bootstrap';
export default class extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    fetch('https://httpbin.org/post', {
      method: 'POST',
      body: this.state.value
    })
    .then(response => response.json())
    .then(response => console.log('Success:', response))
    .catch(error => console.error('Error:', error));
  };

  render() {
    return (
      <form className="Form" onSubmit={this.handleSubmit}>
        <label>
          Address:
          <input type="text" value={this.state.value} onChange={this.handleChange} />
        </label>
        <Button bsSize="small" type="submit">Submit</Button>
      </form>
    );
  }
}
