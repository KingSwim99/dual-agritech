import { Controller } from "@hotwired/stimulus"

// Scroll-reveal + counter animation controller
// Add data-controller="scroll-reveal" to any container (e.g. <body> or <main>).
// Elements with class .reveal will fade in when they enter the viewport.
// Elements with .stat-number[data-target] will count up to their target value.
export default class extends Controller {
  connect() {
    this._observer = new IntersectionObserver(
      (entries) => entries.forEach(entry => this._onEntry(entry)),
      { threshold: 0.15 }
    )

    this.element.querySelectorAll(".reveal").forEach(el => this._observer.observe(el))
  }

  disconnect() {
    if (this._observer) this._observer.disconnect()
  }

  _onEntry(entry) {
    if (!entry.isIntersecting) return

    const el = entry.target
    this._observer.unobserve(el)

    const delay = parseInt(el.dataset.revealDelay || 0, 10)
    const reveal = () => {
      el.classList.add("revealed")

      // Animate any stat counters inside this revealed element
      el.querySelectorAll(".stat-number[data-target]").forEach(counter => {
        this._animateCounter(counter)
      })

      // Also handle if the revealed element itself is a stat-number
      if (el.matches(".stat-number[data-target]")) {
        this._animateCounter(el)
      }
    }

    if (delay > 0) {
      setTimeout(reveal, delay)
    } else {
      reveal()
    }
  }

  _animateCounter(el) {
    const target = parseInt(el.dataset.target, 10)
    const duration = 1800
    const start = performance.now()

    const step = (now) => {
      const elapsed = now - start
      const progress = Math.min(elapsed / duration, 1)
      // Ease out cubic
      const eased = 1 - Math.pow(1 - progress, 3)
      el.textContent = Math.floor(eased * target)
      if (progress < 1) requestAnimationFrame(step)
      else el.textContent = target
    }

    requestAnimationFrame(step)
  }
}
