// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    source: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 12
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // If this is the new toilet form, listen for address changes
    if (this.sourceValue === 'new') {
      this.#setupNewToiletMap()
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    if (this.markersValue.length === 0) {
      // Default to a wider view if no markers
      this.map.setCenter([2.3488, 48.8534])
      return
    }

    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #setupNewToiletMap() {
    this.marker = null

    // Listen for the address-selected event from the parent element
    const addressAutocomplete = this.element.closest('[data-controller="address-autocomplete"]')
    if (!addressAutocomplete) return

    addressAutocomplete.addEventListener('address-selected', (event) => {
      const [lng, lat] = event.detail.coordinates

      // Remove existing marker if any
      if (this.marker) {
        this.marker.remove()
      }

      // Add new marker
      this.marker = new mapboxgl.Marker()
        .setLngLat([lng, lat])
        .addTo(this.map)

      // Center map on new location with animation
      this.map.flyTo({
        center: [lng, lat],
        zoom: 15,
        essential: true
      })
    })
  }
}
