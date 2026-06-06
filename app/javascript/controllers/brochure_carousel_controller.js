import { Controller } from "@hotwired/stimulus"

// Card-slider for brochure images.
// Active slide is centred/full-opacity; prev & next are dimmed and partially
// visible on each side; remaining slides are hidden.
export default class extends Controller {
  static targets = ["slide", "indicator"]
  static values  = { index: { type: Number, default: 0 }, interval: { type: Number, default: 4000 } }

  connect() {
    this.#startAutoplay()
    this.element.addEventListener("mouseenter", this.#pause,  { passive: true })
    this.element.addEventListener("mouseleave", this.#resume, { passive: true })
    this.element.addEventListener("touchstart", this.#pause,  { passive: true })
    this.element.addEventListener("touchend",   this.#resume, { passive: true })
  }

  disconnect() {
    this.#stopAutoplay()
    this.element.removeEventListener("mouseenter", this.#pause)
    this.element.removeEventListener("mouseleave", this.#resume)
    this.element.removeEventListener("touchstart", this.#pause)
    this.element.removeEventListener("touchend",   this.#resume)
  }

  indexValueChanged() {
    if (!this.hasSlideTarget) return
    this.#render()
  }

  next() {
    this.#stopAutoplay()
    this.#advance()
    this.#startAutoplay()
  }

  prev() {
    this.#stopAutoplay()
    this.indexValue = (this.indexValue - 1 + this.slideTargets.length) % this.slideTargets.length
    this.#startAutoplay()
  }

  goTo(event) {
    this.#stopAutoplay()
    this.indexValue = parseInt(event.currentTarget.dataset.index, 10)
    this.#startAutoplay()
  }

  // ── private ────────────────────────────────────────────────────────────────

  #timer  = null
  #pause  = () => this.#stopAutoplay()
  #resume = () => this.#startAutoplay()

  #startAutoplay() {
    if (this.#timer) return
    this.#timer = setInterval(() => this.#advance(), this.intervalValue)
  }

  #stopAutoplay() {
    clearInterval(this.#timer)
    this.#timer = null
  }

  #advance() {
    this.indexValue = (this.indexValue + 1) % this.slideTargets.length
  }

  #render() {
    const total = this.slideTargets.length
    const cur   = this.indexValue
    const prev  = (cur - 1 + total) % total
    const next  = (cur + 1) % total

    this.slideTargets.forEach((slide, i) => {
      if      (i === cur)  slide.dataset.pos = "active"
      else if (i === prev) slide.dataset.pos = "prev"
      else if (i === next) slide.dataset.pos = "next"
      else                 slide.dataset.pos = "hidden"
    })

    this.indicatorTargets.forEach((dot, i) => {
      dot.classList.toggle("active", i === cur)
    })
  }
}
