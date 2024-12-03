import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["stars", "starsInput"]

  setRating(event) {
    event.preventDefault()
    const clickedStar = event.target
    const rating = clickedStar.dataset.value
    this.starsInputTarget.value = rating

    // Aktualisiere das Aussehen der Sterne
    const stars = this.starsTarget.querySelectorAll('i')
    stars.forEach(star => {
      if (star.dataset.value <= rating) {
        star.classList.remove('far')
        star.classList.add('fas')
      } else {
        star.classList.remove('fas')
        star.classList.add('far')
      }
    })
  }
}
