import React from 'react'
import ReactMapboxGl, { Layer, Feature } from 'react-mapbox-gl'

const Map = ReactMapboxGl({
  accessToken: process.env.REACT_APP_MAPBOX_ACCESS_TOKEN
});

export default () => <Map
  style="mapbox://styles/mapbox/streets-v9"
  center={[-116.2044,43.615]}
  containerStyle={{
    width: "45%",
    height: "300px"
  }}>
  <Layer
    type="symbol"
    id="marker"
    layout={{ "icon-image": "marker-15" }}>
    <Feature coordinates={[-116.2044,43.615]}/>
  </Layer>
</Map>
