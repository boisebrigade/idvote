import React from 'react';
import {Route, Redirect} from 'react-router'

import {Query} from 'react-apollo';
import gql from 'graphql-tag';

import debounce from 'lodash/debounce'

import client from '../client'

const addressAutoComplete = gql`
  query AddressAutoComplete($address: String!) {
    address(address: $address) {
      suggestions
    }
  }
`

export default class extends React.Component {
  state = {
    address: '',
    autocomplete: false,
    redirect: false,
    suggestions: []
  };

  addressChange = e => {
    this.setState({address: e.target.value}, this.autocompleteSuggestions)
  }

  addressSubmit = e => {
    e.preventDefault()

    this.setState({
      redirect: true
    })
  }

  autocompleteSuggestions = async () => {
    const {data} = await client.query({
      query: addressAutoComplete,
      variables: {address: this.state.address}
    })

    this.setState({
      suggestions: data.address.suggestions
    })
  }

  autocompleteDebounce = debounce(e => {
    this.setState({
      autocomplete: true
    })

    this.autocompleteSuggestions()
  }, 300)

  selectResult = (e, val) => {
    this.setState({
      address: val
    })

    this.addressSubmit(e)
  }


  render() {
    if (this.state.redirect) {
      const address = this.state.address.split(' ').join('+')
      return <Redirect to={{
        pathname: '/poll',
        search: `?q=${address}`
      }}
      />
    }
    else {
      return <div className="address">
        <div className="container">
          <h1 className="address__title f1 lh-title fw3 tc">Enter your address to find out <br/>
            where you vote in Idaho</h1>
          <form className="address__form" onSubmit={this.addressSubmit}>
            <div className="address__primary">
              <div className="address__wrap">
                <input
                  className="address__input"
                  type="text"
                  value={this.state.address}
                  placeholder="ex. 700 W Jefferson Street, Boise, ID"
                  onChange={this.addressChange}
                  onKeyUp={this.autocompleteDebounce}
                />
                <svg className="address__view" viewBox="0 0 20 11" fill="none"
                     xmlns="http://www.w3.org/2000/svg">
                  <path opacity="0.4" fillRule="evenodd" clipRule="evenodd"
                        d="M19.2653 4.15894C17.3386 2.49715 14.0944 0.0821228 10.0133 0H10.0007H9.98812C5.90835 0.0821228 2.66073 2.49715 0.733972 4.15894L0.722315 4.16888C0.598169 4.27435 0.0103397 4.77391 0.000207866 5.4064C-0.00742153 5.8681 0.195703 6.20918 0.488245 6.49478C2.06246 8.10849 5.49789 10.9778 9.98886 10.9985V11H10.0014H10.0139V10.9985C14.5133 10.9778 17.9383 8.10849 19.5132 6.49478C19.8057 6.20918 20.0081 5.8681 19.9998 5.4064C19.9882 4.77065 19.3956 4.2692 19.2752 4.16728L19.2653 4.15894ZM10.0007 9.75699C7.7933 9.74144 6.0082 7.84065 6.0082 5.49815C6.0082 3.15565 7.7933 1.25487 10.0007 1.24007C12.2137 1.25487 13.9925 3.15565 13.9925 5.49815C13.9925 7.84065 12.2137 9.74071 10.0007 9.75699ZM10.0007 3.84227C10.0048 3.84227 10.0091 3.84227 10.0133 3.843C10.8642 3.8652 11.5373 4.5977 11.5373 5.49815C11.5373 6.39861 10.8642 7.13184 10.0133 7.15329V7.15477C10.0106 7.15477 10.0081 7.15433 10.0059 7.15393C10.0041 7.15359 10.0023 7.15329 10.0007 7.15329C9.99856 7.15329 9.99648 7.15366 9.99441 7.15402C9.99233 7.1544 9.99026 7.15477 9.98812 7.15477V7.15329C9.14272 7.13184 8.46414 6.39861 8.46414 5.49815C8.46414 4.5977 9.1434 3.8652 9.98812 3.843V3.84227H10.0007Z"
                        fill="#3FA2F7"/>
                </svg>
              </div>
              <div className="address__results">
                {this.state.autocomplete && this.state.address.length > 0 ?
                  this.state.suggestions.map((val, i) => {
                    return <div className="address__result" key={i}
                                onClick={e => this.selectResult(e, val)}>{val}</div>
                  })
                  : null}
              </div>
            </div>
            <input className="address__submit" value="Look it up!"
                   type="submit"/>
          </form>
        </div>
      </div>
    }
  }
}

