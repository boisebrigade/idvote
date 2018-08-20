import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import '../App.css'

export default class extends Component {
  state = {
    open: true
  }

  render() {
    return (
      <header className="header">
        <nav className="header__nav">
          <div className="header__detail">
            <Link to="/">
              <svg width="112" height="20" viewBox="0 0 112 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect width="112" height="20" fill="black" fillOpacity="0"/>
                <path
                  d="M29.9688 16.5H28.4688V5.125H29.9688V16.5ZM32.1406 12.2031C32.1406 10.9062 32.4479 9.86458 33.0625 9.07812C33.6771 8.28646 34.4818 7.89062 35.4766 7.89062C36.4661 7.89062 37.25 8.22917 37.8281 8.90625V4.5H39.2734V16.5H37.9453L37.875 15.5938C37.2969 16.3021 36.4922 16.6562 35.4609 16.6562C34.4818 16.6562 33.6823 16.2552 33.0625 15.4531C32.4479 14.651 32.1406 13.6042 32.1406 12.3125V12.2031ZM33.5859 12.3672C33.5859 13.3255 33.7839 14.0755 34.1797 14.6172C34.5755 15.1589 35.1224 15.4297 35.8203 15.4297C36.737 15.4297 37.4062 15.0182 37.8281 14.1953V10.3125C37.3958 9.51562 36.7318 9.11719 35.8359 9.11719C35.1276 9.11719 34.5755 9.39062 34.1797 9.9375C33.7839 10.4844 33.5859 11.2943 33.5859 12.3672ZM46.7422 16.5C46.6589 16.3333 46.5911 16.0365 46.5391 15.6094C45.8672 16.3073 45.0651 16.6562 44.1328 16.6562C43.2995 16.6562 42.6146 16.4219 42.0781 15.9531C41.5469 15.4792 41.2812 14.8802 41.2812 14.1562C41.2812 13.276 41.6146 12.5938 42.2812 12.1094C42.9531 11.6198 43.8958 11.375 45.1094 11.375H46.5156V10.7109C46.5156 10.2057 46.3646 9.80469 46.0625 9.50781C45.7604 9.20573 45.3151 9.05469 44.7266 9.05469C44.2109 9.05469 43.7786 9.1849 43.4297 9.44531C43.0807 9.70573 42.9062 10.0208 42.9062 10.3906H41.4531C41.4531 9.96875 41.6016 9.5625 41.8984 9.17188C42.2005 8.77604 42.6068 8.46354 43.1172 8.23438C43.6328 8.00521 44.1979 7.89062 44.8125 7.89062C45.7865 7.89062 46.5495 8.13542 47.1016 8.625C47.6536 9.10938 47.9401 9.77865 47.9609 10.6328V14.5234C47.9609 15.2995 48.0599 15.9167 48.2578 16.375V16.5H46.7422ZM44.3438 15.3984C44.7969 15.3984 45.2266 15.2812 45.6328 15.0469C46.0391 14.8125 46.3333 14.5078 46.5156 14.1328V12.3984H45.3828C43.612 12.3984 42.7266 12.9167 42.7266 13.9531C42.7266 14.4062 42.8776 14.7604 43.1797 15.0156C43.4818 15.2708 43.8698 15.3984 44.3438 15.3984ZM51.6719 9.07031C52.3125 8.28385 53.1458 7.89062 54.1719 7.89062C55.9583 7.89062 56.8594 8.89844 56.875 10.9141V16.5H55.4297V10.9062C55.4245 10.2969 55.2839 9.84635 55.0078 9.55469C54.737 9.26302 54.3125 9.11719 53.7344 9.11719C53.2656 9.11719 52.8542 9.24219 52.5 9.49219C52.1458 9.74219 51.8698 10.0703 51.6719 10.4766V16.5H50.2266V4.5H51.6719V9.07031ZM58.6562 12.1953C58.6562 11.3672 58.8177 10.6224 59.1406 9.96094C59.4688 9.29948 59.9219 8.78906 60.5 8.42969C61.0833 8.07031 61.7474 7.89062 62.4922 7.89062C63.6432 7.89062 64.5729 8.28906 65.2812 9.08594C65.9948 9.88281 66.3516 10.9427 66.3516 12.2656V12.3672C66.3516 13.1901 66.1927 13.9297 65.875 14.5859C65.5625 15.237 65.112 15.7448 64.5234 16.1094C63.9401 16.474 63.2682 16.6562 62.5078 16.6562C61.362 16.6562 60.4323 16.2578 59.7188 15.4609C59.0104 14.6641 58.6562 13.6094 58.6562 12.2969V12.1953ZM60.1094 12.3672C60.1094 13.3047 60.3255 14.0573 60.7578 14.625C61.1953 15.1927 61.7786 15.4766 62.5078 15.4766C63.2422 15.4766 63.8255 15.1901 64.2578 14.6172C64.6901 14.0391 64.9062 13.2318 64.9062 12.1953C64.9062 11.2682 64.6849 10.5182 64.2422 9.94531C63.8047 9.36719 63.2214 9.07812 62.4922 9.07812C61.7786 9.07812 61.2031 9.36198 60.7656 9.92969C60.3281 10.4974 60.1094 11.3099 60.1094 12.3672ZM76.125 14.5078L79.375 5.125H81.0156L76.7969 16.5H75.4688L71.2578 5.125H72.8906L76.125 14.5078ZM81.5781 12.1953C81.5781 11.3672 81.7396 10.6224 82.0625 9.96094C82.3906 9.29948 82.8438 8.78906 83.4219 8.42969C84.0052 8.07031 84.6693 7.89062 85.4141 7.89062C86.5651 7.89062 87.4948 8.28906 88.2031 9.08594C88.9167 9.88281 89.2734 10.9427 89.2734 12.2656V12.3672C89.2734 13.1901 89.1146 13.9297 88.7969 14.5859C88.4844 15.237 88.0339 15.7448 87.4453 16.1094C86.862 16.474 86.1901 16.6562 85.4297 16.6562C84.2839 16.6562 83.3542 16.2578 82.6406 15.4609C81.9323 14.6641 81.5781 13.6094 81.5781 12.2969V12.1953ZM83.0312 12.3672C83.0312 13.3047 83.2474 14.0573 83.6797 14.625C84.1172 15.1927 84.7005 15.4766 85.4297 15.4766C86.1641 15.4766 86.7474 15.1901 87.1797 14.6172C87.612 14.0391 87.8281 13.2318 87.8281 12.1953C87.8281 11.2682 87.6068 10.5182 87.1641 9.94531C86.7266 9.36719 86.1432 9.07812 85.4141 9.07812C84.7005 9.07812 84.125 9.36198 83.6875 9.92969C83.25 10.4974 83.0312 11.3099 83.0312 12.3672ZM93.0469 6V8.04688H94.625V9.16406H93.0469V14.4062C93.0469 14.7448 93.1172 15 93.2578 15.1719C93.3984 15.3385 93.638 15.4219 93.9766 15.4219C94.1432 15.4219 94.3724 15.3906 94.6641 15.3281V16.5C94.2839 16.6042 93.9141 16.6562 93.5547 16.6562C92.9089 16.6562 92.4219 16.4609 92.0938 16.0703C91.7656 15.6797 91.6016 15.125 91.6016 14.4062V9.16406H90.0625V8.04688H91.6016V6H93.0469ZM99.8281 16.6562C98.6823 16.6562 97.75 16.2812 97.0312 15.5312C96.3125 14.776 95.9531 13.7682 95.9531 12.5078V12.2422C95.9531 11.4036 96.112 10.6562 96.4297 10C96.7526 9.33854 97.2005 8.82292 97.7734 8.45312C98.3516 8.07812 98.9766 7.89062 99.6484 7.89062C100.747 7.89062 101.602 8.2526 102.211 8.97656C102.82 9.70052 103.125 10.737 103.125 12.0859V12.6875H97.3984C97.4193 13.5208 97.6615 14.1953 98.125 14.7109C98.5938 15.2214 99.1875 15.4766 99.9062 15.4766C100.417 15.4766 100.849 15.3724 101.203 15.1641C101.557 14.9557 101.867 14.6797 102.133 14.3359L103.016 15.0234C102.307 16.112 101.245 16.6562 99.8281 16.6562ZM99.6484 9.07812C99.0651 9.07812 98.5755 9.29167 98.1797 9.71875C97.7839 10.1406 97.5391 10.7344 97.4453 11.5H101.68V11.3906C101.638 10.6562 101.44 10.0885 101.086 9.6875C100.732 9.28125 100.253 9.07812 99.6484 9.07812ZM109.727 14.2578C109.727 13.8672 109.578 13.5651 109.281 13.3516C108.99 13.1328 108.477 12.9453 107.742 12.7891C107.013 12.6328 106.432 12.4453 106 12.2266C105.573 12.0078 105.255 11.7474 105.047 11.4453C104.844 11.1432 104.742 10.7839 104.742 10.3672C104.742 9.67448 105.034 9.08854 105.617 8.60938C106.206 8.13021 106.956 7.89062 107.867 7.89062C108.826 7.89062 109.602 8.13802 110.195 8.63281C110.794 9.1276 111.094 9.76042 111.094 10.5312H109.641C109.641 10.1354 109.471 9.79427 109.133 9.50781C108.799 9.22135 108.378 9.07812 107.867 9.07812C107.341 9.07812 106.93 9.19271 106.633 9.42188C106.336 9.65104 106.188 9.95052 106.188 10.3203C106.188 10.6693 106.326 10.9323 106.602 11.1094C106.878 11.2865 107.375 11.4557 108.094 11.6172C108.818 11.7786 109.404 11.9714 109.852 12.1953C110.299 12.4193 110.63 12.6901 110.844 13.0078C111.062 13.3203 111.172 13.7031 111.172 14.1562C111.172 14.9115 110.87 15.5182 110.266 15.9766C109.661 16.4297 108.878 16.6562 107.914 16.6562C107.237 16.6562 106.638 16.5365 106.117 16.2969C105.596 16.0573 105.188 15.724 104.891 15.2969C104.599 14.8646 104.453 14.3984 104.453 13.8984H105.898C105.924 14.3828 106.117 14.7682 106.477 15.0547C106.841 15.3359 107.32 15.4766 107.914 15.4766C108.461 15.4766 108.898 15.3672 109.227 15.1484C109.56 14.9245 109.727 14.6276 109.727 14.2578Z"
                  fill="#297FCA"/>
                <path d="M9.99219 14.5078L13.2422 5.125H14.8828L10.6641 16.5H9.33594L5.125 5.125H6.75781L9.99219 14.5078Z"
                      fill="#297FCA"/>
                <circle cx="10" cy="10" r="9.25" stroke="#297FCA" strokeWidth="1.5"/>
              </svg>
              </Link>
          </div>
          <ul className="header__container">
            <li className="header__element">
              <Link to="/menu/one">Menu One</Link>
            </li>
            <li className="header__element">
              <Link  to="/menu/two">Menu Two</Link>
            </li>
            <li className="header__element">
              <Link  to="/menu/three">Menu Three</Link>
              <svg className="header__arrow" width="10" height="6" viewBox="0 0 10 6" fill="none"
                   xmlns="http://www.w3.org/2000/svg">
                <rect width="6" height="10" fill="black" fillOpacity="0" transform="translate(10) rotate(90)"/>
                <path fillRule="evenodd" clipRule="evenodd"
                      d="M-0.000249863 1.00025C-0.000249863 1.25625 0.0977507 1.51225 0.29275 1.70725L4.29275 5.70725C4.68375 6.09825 5.31575 6.09825 5.70675 5.70725L9.70675 1.70725C10.0978 1.31625 10.0978 0.684253 9.70675 0.293253C9.31575 -0.0977464 8.68375 -0.0977464 8.29275 0.293253L4.99975 3.58625L1.70675 0.293253C1.31575 -0.0977464 0.68375 -0.0977464 0.29275 0.293253C0.0977507 0.488254 -0.000249863 0.744254 -0.000249863 1.00025Z"
                      fill="#3FA2F7"/>
              </svg>
            </li>

          </ul>
          <div className="header__menu">
            &#9776;
          </div>
        </nav>
      </header>
    );
  }
}