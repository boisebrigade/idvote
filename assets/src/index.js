import React, {Component} from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom'
import ReactDOM from 'react-dom'

import {ApolloProvider} from "react-apollo";

import Header from './components/Header'

import Home from './pages/Home'
import P404 from './pages/404'

import PollingPlace from './pages/PollingPlace'

import 'normalize.css/normalize.css'
import './App.css'

import client from './client'

const App = () =>
  <BrowserRouter>
    <main>
      <Header />
      <Switch>
        <ApolloProvider client={client}>
          <Route exact path="/" component={Home}/>
          <Route path="/poll" component={PollingPlace}/>
        </ApolloProvider>
        <Route component={P404}/>
      </Switch>
    </main>
  </BrowserRouter>

ReactDOM.render(<App />, document.getElementById('root'));
