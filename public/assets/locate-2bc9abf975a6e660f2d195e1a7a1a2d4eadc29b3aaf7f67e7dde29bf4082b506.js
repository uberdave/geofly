
	function displayFaces() {
	var timeoutVal = 10 * 1000 * 1000;
	if (navigator.geolocation) {
	 navigator.geolocation.getCurrentPosition(
	 displayPosition,
	
     displayError,
     { enableHighAccuracy: true, timeout: timeoutVal, maximumAge: 0 }
   );
 } else {
   alert("Geolocation is not supported by this browser");
 }
 }
function displayPosition(position) {
  //alert("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude);
  setGeoCookie(position);
  var sliderValue = document.getElementById('slider-fill').value
  setRangeCookie(sliderValue);
  window.location.href =  'https://geofly.me/posts.html';
  $.mobile.loading('show');
 //alert(window.location.href);
 //window.location.replace(window.location.href);
 }
function setGeoCookie(position) {
  
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
 
}
function setRangeCookie(sliderValue) {

  var cookie_val = sliderValue;
  document.cookie = "range=" + escape(cookie_val);
 
}
 function displayError(error) {
   var errors = { 
     1: 'Permission denied',
     2: 'Position unavailable',
     3: 'Request timeout'
   };
   alert("Error: " + errors[error.code]);
 }
;
