window.onload=function()
{
    var map = L.map('map').setView([51.518781, -0.16811], 13);
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiZGFueWFsODEwIiwiYSI6ImNreGJ2NDZsOTBpamIyb3BkcjBrZGxpbTAifQ.hj8g3KFG0DZh9hh3F5NTDQ'
    }).addTo(map);

    addSearch(map);
    mapClickEvent(map);
    loadCoordinates(map);
    createMarkers(map);
}
function loadCoordinates(map)
{
 // const cities = ['Los Angeles', 'Houston', 'Dhaka', 'Los Angeles', 'London'];
  const latitudes = [33.908382, 52.516358, 23.705804, 33.7897078, 51.518781];
  const longitudes = [-118.3636401, 13.519744, 90.444807, -118.3122778, -0.16811];
  for (i = 0; i < latitudes.length; i++)
  {
    createCircles(map, latitudes[i], longitudes[i]);
  }
}
function createCircles(map, latitude, longitude){
  var circle = L.circle([latitude, longitude], {
    color: 'blue',
    fillColor: '#0000FF',
    fillOpacity: 0.5,
    radius: 500
}).addTo(map);
}
function createMarkers(map)
{
  const latitudes = [33.908382, 52.516358, 23.705804, 33.7897078, 51.518781];
  const longitudes = [-118.3636401, 13.519744, 90.444807, -118.3122778, -0.16811];
  const pages = ["Al Watan Halal Tandoori Restaurant.html", "Aga's Restaurant.html", "Bismillah Restaurant.html", "Famous Tandoori.html", "Halal Restaurant Menu.html"];
  const markers = [null, null, null, null, null];
  for (i = 0; i < latitudes.length; i++)
  {
    markers[i] = L.marker([latitudes[i], longitudes[i]]).addTo(map);
  }
  markers[0].on('click', function(e) {
    window.open(pages[0], "_self");
 }); 
 markers[1].on('click', function(e) {
  window.open(pages[1], "_self");
}); 
markers[2].on('click', function(e) {
  window.open(pages[2], "_self");
}); 
markers[3].on('click', function(e) {
  window.open(pages[3], "_self");
}); 
  markers[4].on('click', function(e) {
    window.open(pages[4], "_self");
 }); 
}
function mapClickEvent(map)
{
  var popup = L.popup();
  function onMapClick(e) {
    popup.setLatLng(e.latlng).setContent("No Hotel found at this location!").openOn(map);
  }
  map.on('click', onMapClick);
}

function addSearch(map)
{
  const provider = new window.GeoSearch.OpenStreetMapProvider();
  const search = new GeoSearch.GeoSearchControl({
    provider: provider,
    style: 'bar',
    updateMap: true,
    autoClose: true,
  }).addTo(map);
}