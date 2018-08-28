import React from 'react'
import ReactMapboxGl, {
  Layer,
  Feature,
  GeoJSONLayer
} from 'react-mapbox-gl'

const Map = ReactMapboxGl({
  accessToken: process.env.MAPBOX_ACCESS_TOKEN
});

const precinctStyle = {
  "fill-color": "#3EC28F",
  "fill-opacity": 0.2
}

export default ({address, boundry}) => {
  const {
    coordinates: [
      {x, y}
    ]
  } = address

  const geoJSON = JSON.parse(boundry)

  return <div className="poll__map">
    <Map style="mapbox://sprites/mapbox/bright-v8" center={[x, y]} zoom={[15]}>
      <GeoJSONLayer data={geoJSON} fillPaint={precinctStyle}/>
      <Layer
        type="symbol"
        id="marker"
        layout={{"icon-image": "marker-15", "icon-size": 2}}>
        <Feature coordinates={[x, y]}/>
      </Layer>
    </Map>
  </div>
}
