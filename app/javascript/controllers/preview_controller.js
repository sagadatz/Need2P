import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "input"]

  updatePreview(event) {
    const input = event.target
    const output = this.outputTarget

    if (input.files && input.files[0]) {
      output.classList.remove("d-none")
      output.src = URL.createObjectURL(input.files[0])
    } else {
      output.classList.add("d-none")
      output.src = ""
    }
  }
}
