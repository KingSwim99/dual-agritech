import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { action: String }

  connect() {
    const siteKey = document.querySelector('meta[name="recaptcha-site-key"]')?.content
    if (!siteKey || typeof grecaptcha === "undefined") return

    // Re-trigger the badge after Turbo replaces the body on navigation.
    grecaptcha.ready(() => {
      grecaptcha.execute(siteKey, { action: "pageview" }).then(() => {})
    })
  }

  submit(event) {
    const tokenInput = this.element.querySelector('input[name="g-recaptcha-response"]')

    // Token already filled by a previous call — let the submission proceed.
    if (tokenInput && tokenInput.value.length > 0) return

    event.preventDefault()

    const siteKey = document.querySelector('meta[name="recaptcha-site-key"]')?.content

    // reCAPTCHA not configured yet — submit without token.
    if (!siteKey || typeof grecaptcha === "undefined") {
      this.element.requestSubmit()
      return
    }

    const action = this.actionValue

    grecaptcha.ready(() => {
      grecaptcha.execute(siteKey, { action }).then(token => {
        if (tokenInput) tokenInput.value = token

        const dataInput = this.element.querySelector(
          `input[name="g-recaptcha-response-data[${action}]"]`
        )
        if (dataInput) dataInput.value = token

        this.element.requestSubmit()
      })
    })
  }
}
