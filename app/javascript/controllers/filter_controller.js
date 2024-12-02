import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["stars", "starsInput"]

  connect() {
    this.starsTarget.querySelectorAll('i').forEach(star => {
      star.style.cursor = 'pointer'
      star.addEventListener('click', (e) => this.setRating(e.target))
      star.addEventListener('mouseover', (e) => this.hoverRating(e.target))
      star.addEventListener('mouseout', () => this.resetRating())
    })
  }

  setRating(clickedStar) {
    const value = clickedStar.dataset.value
    this.starsInputTarget.value = value
    this.updateStars(value)
    // Speichern der ausgewählten Bewertung
    this.selectedRating = value
  }

  hoverRating(hoveredStar) {
    const value = hoveredStar.dataset.value
    this.updateStars(value)
  }

  resetRating() {
    // Zurück zur ausgewählten Bewertung oder alle Sterne leer
    this.updateStars(this.selectedRating || 0)
  }

  updateStars(value) {
    this.starsTarget.querySelectorAll('i').forEach(star => {
      const starValue = parseInt(star.dataset.value)
      if (starValue <= value) {
        star.classList.remove('far')
        star.classList.add('fas')
      } else {
        star.classList.remove('fas')
        star.classList.add('far')
      }
    })
  }
}
