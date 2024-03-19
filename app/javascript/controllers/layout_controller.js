import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reading_progress"
export default class extends Controller {
  logActiveControllers() {
    console.log(
      "Active Controllers",
      Stimulus.controllers.map((controller) => controller.identifier)
    )
  }
}
