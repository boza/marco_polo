window.gmapsInitialize = ->
  mapOptions = {}
  mapWrapper = $("#map-wrapper")
  locations = mapWrapper.data("locations")
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  bounds = new google.maps.LatLngBounds()
  travel_journal_id = mapWrapper.data('travel_journal_id')
  i = 0

  while i < locations.length

    location = locations[i]

    contentString =  '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      "<h5 id=\"firstHeading\" class=\"firstHeading\">#{location.address}</h5>"+
      '<div id="bodyContent">'+
      "<p>#{location.post || 'Write a post'}</p>"+
      "<p><a href='/travel_journals/#{travel_journal_id}/locations/#{location.id}/edit'>Add Images and Journal Entry!</a></p>"+
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
    map.setCenter(new google.maps.LatLng( 40.748444, -73.9856750))
    map.setZoom 4
  return

google.maps.event.addDomListener window, "load", gmapsInitialize