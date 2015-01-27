$('#map-wrapper').replaceWith('<%= escape_javascript(render("travel_journals/map", travel_journal: @travel_journal)) %>')
gmapsInitialize()
$('#locationForm').foundation('reveal', 'close');
$('#new_location').find('#location_address').val('')