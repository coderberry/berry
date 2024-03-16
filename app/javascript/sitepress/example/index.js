import "./index.css"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="example"
export default class extends Controller {
  connect() {
    console.log("Hello, Example!", this.element)
  }
}
