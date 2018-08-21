import React from 'react';
import Map from './Map'

export default class extends React.Component {
  render() {
    return <div className="container">
      <h1>You vote on November 6th at:</h1>
      <div className="poll">
        <div className="poll__details">
          <h2> {this.props.address}</h2>
          <div className="poll__when">
            <span className="poll__hours">Hours: {this.props.opening_time} - {this.props.closing_time}</span>
            <span className="poll__calendar">
                <svg className="poll__icon" width="20" height="22" viewBox="0 0 20 22" fill="none"
                     xmlns="http://www.w3.org/2000/svg">
                  <rect width="18" height="20" fill="black" fillOpacity="0" transform="translate(1 1)"/>
                  <path
                    d="M17 3H3C1.89543 3 1 3.89543 1 5V19C1 20.1046 1.89543 21 3 21H17C18.1046 21 19 20.1046 19 19V5C19 3.89543 18.1046 3 17 3Z"
                    stroke="#297FCA" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M14 1V5" stroke="#297FCA" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M6 1V5" stroke="#297FCA" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  <path d="M1 9H19" stroke="#297FCA" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>

                Add to Calendar
              </span>
          </div>
        </div>
        <Map />
      </div>
    </div>
  }
}

