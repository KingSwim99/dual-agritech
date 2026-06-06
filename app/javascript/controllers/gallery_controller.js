import { Controller } from "@hotwired/stimulus"

// Gallery controller — handles tab switching, expand/collapse, and lightbox.
// Attach data-controller="gallery" to the page wrapper.
export default class extends Controller {
  static targets = ["lightbox", "lightboxImg", "lightboxCaption"]

  connect() {
    this._images = []
    this._index  = 0
    this._boundKeydown = this._onKeydown.bind(this)
    document.addEventListener("keydown", this._boundKeydown)

    this._fadeObserver = new IntersectionObserver(
      (entries) => entries.forEach(entry => {
        if (!entry.isIntersecting) return
        entry.target.classList.add("gallery-visible")
        this._fadeObserver.unobserve(entry.target)
      }),
      { threshold: 0.1 }
    )
    this._observeFadeElements()
  }

  disconnect() {
    if (this._fadeObserver) this._fadeObserver.disconnect()
    document.removeEventListener("keydown", this._boundKeydown)
  }

  _observeFadeElements() {
    this.element.querySelectorAll(".gallery-fade:not(.gallery-hidden):not(.gallery-visible)")
      .forEach(el => this._fadeObserver.observe(el))
  }

  // ── Tabs ───────────────────────────────────────────────────────────────────

  switchTab(event) {
    const tab = event.currentTarget.dataset.tab
    this.element.querySelectorAll(".gallery-tab-btn").forEach(btn => {
      btn.classList.toggle("active", btn.dataset.tab === tab)
    })
    this.element.querySelectorAll(".gallery-panel").forEach(panel => {
      panel.classList.toggle("d-none", panel.dataset.tab !== tab)
    })
  }

  // ── Expand / Collapse ──────────────────────────────────────────────────────

  expand(event) {
    const btn    = event.currentTarget
    const grid   = this.element.querySelector(`#${btn.dataset.gridId}`)
    const limit  = parseInt(btn.dataset.limit, 10)
    const expanded = btn.dataset.expanded === "true"

    grid.querySelectorAll(".gallery-thumb").forEach((thumb, i) => {
      if (expanded) {
        if (i >= limit) thumb.classList.add("gallery-hidden")
      } else {
        thumb.classList.remove("gallery-hidden")
      }
    })

    btn.querySelector(".more-label").classList.toggle("d-none", !expanded)
    btn.querySelector(".less-label").classList.toggle("d-none", expanded)
    btn.dataset.expanded = String(!expanded)

    if (!expanded) this._observeFadeElements()
  }

  // ── Lightbox ───────────────────────────────────────────────────────────────

  backdropClick(event) {
    if (event.target === this.lightboxTarget) this.closeLightbox()
  }

  open(event) {
    const thumb = event.currentTarget
    const grid  = thumb.closest(".gallery-grid")
    this._images = [...grid.querySelectorAll(".gallery-thumb")]
    this._index  = this._images.indexOf(thumb)
    this._renderLightbox()
    this.lightboxTarget.classList.add("active")
    document.body.classList.add("gallery-open")
  }

  closeLightbox() {
    this.lightboxTarget.classList.remove("active")
    document.body.classList.remove("gallery-open")
  }

  prevImage() {
    this._index = (this._index - 1 + this._images.length) % this._images.length
    this._renderLightbox()
  }

  nextImage() {
    this._index = (this._index + 1) % this._images.length
    this._renderLightbox()
  }

  _renderLightbox() {
    const thumb = this._images[this._index]
    const img   = thumb.querySelector("img")
    this.lightboxImgTarget.src = img.src
    this.lightboxImgTarget.alt = img.alt
    this.lightboxCaptionTarget.textContent = thumb.dataset.caption || ""
  }

  _onKeydown(e) {
    if (!this.lightboxTarget.classList.contains("active")) return
    if (e.key === "Escape")     this.closeLightbox()
    if (e.key === "ArrowLeft")  this.prevImage()
    if (e.key === "ArrowRight") this.nextImage()
  }
}
