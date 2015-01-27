initialize = ->
  mapOptions = {}
  mapWrapper = $("#map-wrapper")
  locations = mapWrapper.data("locations")
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  bounds = new google.maps.LatLngBounds()
  i = 0

  while i < locations.length

    location = locations[i]

    contentString =  '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      "<h5 id=\"firstHeading\" class=\"firstHeading\">#{location.address}</h5>"+
      '<div id="bodyContent">'+
      "<p>#{location.post || 'Write a post'}</p>"+
      '</div>'+
      '</div>';

    infowindow = new google.maps.InfoWindow

    
    marker = new google.maps.Marker
      position: new google.maps.LatLng(location.lat, location.lng)
      map: map
      animation: google.maps.Animation.DROP
      title: location.address
      contentString: contentString
    
    bounds.extend marker.getPosition()
    
    google.maps.event.addListener marker, 'click', (->
        infowindow.setContent( this.contentString );
        infowindow.open( map, this ) 
      )

    i++
  
  if locations.length > 0
    map.fitBounds bounds
  else
    map.setZoom 4
  return

google.maps.event.addDomListener window, "load", initialize