import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="demo"
export default class extends Controller {
  static targets = ["tabs", "frame", "console", "consoleWrapper"]
  static values = {active: String}

  connect() {
    this.clearConsoleEvents()
    console.log("tabs", this.tabsTarget)
    console.log("frame", this.frameTarget)
    console.log("console", this.consoleTarget)
    console.log("consoleWrapper", this.consoleWrapperTarget)
  }

  // Click handler for tab selection.
  // This will re-render the tabs and the frame
  selectTab(event) {
    console.log('New tabs src', event.target.dataset.activeTabTabsPath)
    this.tabsTarget.src = event.target.dataset.activeTabTabsPath

    console.log('New frame src', event.target.dataset.activeTabFramePath)
    this.frameTarget.src = event.target.dataset.activeTabFramePath

    // event.preventDefault()
    //
    // const button = event.target
    // const li = button.parentElement
    //
    // this.tabTargets.forEach((tab) => tab.classList.remove('active'))
    //
    // this.activeValue = li.dataset.tabId
    // li.classList.add('active')
    //
    // if (this.activeValue === 'tab-demo') {
    //   this.clearConsoleEvents()
    //   this.consoleWrapperTarget.classList.remove('hidden')
    // } else {
    //   this.consoleWrapperTarget.classList.add('hidden')
    // }
    //
    // this.frameTarget.src = li.dataset.src
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
