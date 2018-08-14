import React from 'react';
import { Form, FormGroup, FormControl, Button } from 'react-bootstrap';
const URL = "https://httpbin.org/post";
export default class extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      value: '',
      address:''
    };

    this.fetchAddress = this.fetchAddress.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  fetchAddress() {
    fetch(`${process.env.PUBLIC_URL}/api/find`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({address: this.state.value})
    })
    .then(response => response.json())
    .then(response => {
      console.log(response)
      return response;
    })
    .then(response => this.setState({address: response.data}))
    .catch(error => console.error('Error:', error));
  };

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.fetchAddress();
  };

  getValidationState() {
    const length = this.state.value.length;
    if (length > 10) return 'success';
    else if (length > 5) return 'warning';
    else if (length > 0) return 'error';
    return null;
  }


  render() {
    const { address } = this.state;
    return (
      <div className="container">
        <p className="main">{address}</p>
        <p className="main">To find our where you vote, please enter your address</p>
        <div className="">
          <Form inline className="form" onSubmit={this.handleSubmit}>
            <FormGroup
              controlId="formBasicText">
              <FormControl
                type="text"
                bsSize="large"
                value={this.state.value}
                onChange={this.handleChange}
              />
              <FormControl.Feedback />
            </FormGroup>
            <Button bsStyle="primary" type="submit">Submit</Button>
          </Form>
        </div>
      </div>
    );
  }
}
