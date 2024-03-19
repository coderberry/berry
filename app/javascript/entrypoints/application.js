console.log("Vite ⚡️ Rails")

import "@hotwired/turbo-rails"

import debounced from "debounced"
debounced.initialize()

import "./application.scss"
import "../controllers"
