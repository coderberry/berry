export function dispatchConsoleEvent(target, msg) {
  const event = new CustomEvent('demo:console-event', { detail: { msg: msg }, bubbles: true })
  target.dispatchEvent(event)
}
