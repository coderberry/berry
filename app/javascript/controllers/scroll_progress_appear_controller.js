import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition"

// Connects to data-controller="scroll-progress-appear"
export default class extends Controller {
  static values = {
    isHidden: { type: Boolean, default: true },
    minY: { type: Number, default: 250 },
  }

  connect() {
    console.log("Connected to scroll_progress_appear_controller", this.element)

    this.scroll()
  }

  scroll() {
    if (window.scrollY > this.minYValue) {
      enter(this.element)
    } else {
      leave(this.element)
    }
  }

  scrollToTop(event) {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    })
  }
}
