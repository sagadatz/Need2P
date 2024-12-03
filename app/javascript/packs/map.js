// Assuming you have a function to initialize your map
function initMap() {
  // ... existing map setup code ...

  // Define the custom icon
  const toiletIcon = L.icon({
    iconUrl: '/assets/blue_toilet_marker.png', // Path to your custom marker image
    iconSize: [32, 32], // Size of the icon
    iconAnchor: [16, 32], // Point of the icon which will correspond to marker's location
    popupAnchor: [0, -32] // Point from which the popup should open relative to the iconAnchor
  });

  // Example of adding a marker with the custom icon
  L.marker([latitude, longitude], { icon: toiletIcon }).addTo(map)
    .bindPopup('Toilet Location');

  // ... existing code to add other markers ...
}

// Call the function to initialize the map
document.addEventListener('DOMContentLoaded', initMap); 
