import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="demo"
export default class extends Controller {
  static targets = ["container", "tab", "consoleWrapper", "console", "frame"]
  static values = {active: String}

  connect() {
    this.clearConsoleEvents()
  }

  copyToClipboard(event) {
    event.preventDefault()
  }

  selectTab(event) {
    event.preventDefault()

    const button = event.target
    const li = button.parentElement

    this.tabTargets.forEach((tab) => tab.classList.remove('active'))

    this.activeValue = li.dataset.tabId
    li.classList.add('active')

    if (this.activeValue === 'tab-demo') {
      this.clearConsoleEvents()
      this.consoleWrapperTarget.classList.remove('hidden')
    } else {
      this.consoleWrapperTarget.classList.add('hidden')
    }

    this.frameTarget.src = li.dataset.src
  }

  clearConsoleEvents() {
    this.consoleTarget.innerHTML = ''
  }

  appendConsoleEvent(event) {
    this.limitConsoleEvents(5)
    console.log(event)
    const msg = event.detail.msg

    // const currentTime = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit', second:'2-digit'})
    const currentTime = new Date().toTimeString().slice(0, 8)

    // <pre className="flex-1"><code className="text-sm font-mono"></code></pre>
    const pre = document.createElement('pre')
    pre.classList.add('flex-1')
    const code = document.createElement('code')
    code.classList.add('text-xs', 'font-mono', 'p-2', 'text-gray-500', 'hover:text-gray-300')
    code.innerText = currentTime + ': ' + msg
    pre.appendChild(code)
    this.consoleTarget.appendChild(pre)
  }

  limitConsoleEvents(numEvents) {
    const consoleEvents = this.consoleTarget.querySelectorAll('pre')
    if (consoleEvents.length > 10) {
      consoleEvents[0].remove()
    }
  }
}
