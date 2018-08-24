import React from 'react';
import Map from './Map'

export default (props) => {
  return <div className="poll">
    <div className="container">
      <h1 className="f1 lh-title fw3 tc">You vote on November 6th at:</h1>
      <div className="poll__content">
        <div className="poll__details">
          <h3 className="poll__location f3 lh-title fw4"> {props.precinct.name} </h3>
          <a className="poll__link f2 lh-title fw3" href={`geo:${props.precinct.address}`}><address className="poll__address">{props.precinct.address}</address></a>
          <div className="poll__when">
            <span className="poll__hours">Hours: <time>{props.precinct.openingTime} - {props.precinct.closingTime}</time></span>
          </div>
        </div>
        <Map address={props.precinct.addressGeoencoded}
             boundry={props.precinct.geometry}/>
      </div>
    </div>
  </div>
}
