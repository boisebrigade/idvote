import React, {Component} from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom'
import ReactDOM from 'react-dom'

import Header from './components/Header'

import Home from './pages/Home'
import P404 from './pages/404'

import PollingPlace from './pages/PollingPlace'

import './App.css'

const App = () =>
  <BrowserRouter>
    <React.Fragment>
      <Header />
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/poll/:address" component={PollingPlace} />
        <Route component={P404} />
      </Switch>
    </React.Fragment>
  </BrowserRouter>

ReactDOM.render(<App />, document.getElementById('root'));
