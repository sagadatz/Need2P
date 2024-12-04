import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static targets = ["address", "latitude", "longitude"]
  static values = {
    apiKey: String
  }

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "address",
      placeholder: "Enter the toilet's address",
      mapboxgl: mapboxgl
    })

    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => {
      const coordinates = event.result.geometry.coordinates
      this.latitudeTarget.value = coordinates[1]
      this.longitudeTarget.value = coordinates[0]
      this.addressTarget.value = event.result.place_name

      // Dispatch a custom event that the map controller can listen to
      const addressChangeEvent = new CustomEvent('address-selected', {
        detail: { coordinates: coordinates }
      })
      this.element.dispatchEvent(addressChangeEvent)
    })

    this.geocoder.on("clear", () => {
      this.addressTarget.value = ""
      this.latitudeTarget.value = ""
      this.longitudeTarget.value = ""
    })

    // Add Mapbox geocoder styles
    const link = document.createElement('link')
    link.href = "https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.css"
    link.rel = "stylesheet"
    document.head.appendChild(link)
  }
}
