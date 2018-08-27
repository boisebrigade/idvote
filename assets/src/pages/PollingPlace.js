import React, {Component} from 'react'

import {Redirect} from 'react-router'

import {Query} from 'react-apollo';
import gql from 'graphql-tag';

import queryString from 'query-string'

import Problem from './../components/Problem'
import Polling from './../components/Polling'
import Footer from './../components/Footer'

const getPrecinct = gql`
  query GetPrecinct($address: String!) {
    precinct(address: $address) {
      name
      address
      closingTime
      openingTime
      date
      geometry
      addressGeoencoded {
        srid,
        coordinates {
          x y        
        }
      }
    }
  }
`;

export default props => {
  const {
    location: {
      search: search = ''
    }
  } = props

  const {
    q: address = null
  } = queryString.parse(search)

  if (!address) {
    return <Redirect to={{
      pathname: '/',
    }}
    />
  }

  return <Query query={getPrecinct} variables={{address: address}}
                errorPolicy="all">
    {({loading, error, data}) => {
      if (loading) {
        return <React.Fragment>
          <div className="loading"/>
          <Footer/>
        </React.Fragment>
      }

      if (error) {
        return <React.Fragment>
          <Problem>
            {error.graphQLErrors.map(({message}, i) => (
              <h3 key={i}>{message}</h3>
            ))}
          </Problem>
          <Footer/>
        </React.Fragment>
      }

      return <React.Fragment>
        <Polling {...data} />
        <Footer/>
      </React.Fragment>
    }
    }
  </Query>
}
