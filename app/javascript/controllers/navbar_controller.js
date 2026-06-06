import { Controller } from "@hotwired/stimulus"

// Navbar transparency controller
// Automatically transparent when a .hero-section is present on the page.
// Works with Turbo Drive navigations since connect() fires on every page change.
export default class extends Controller {
  connect() {
    this._onHeroPage = !!document.querySelector('.hero-section')

    if (this._onHeroPage) {
      this.element.classList.add("navbar-transparent")
      this._onScroll = this._handleScroll.bind(this)
      window.addEventListener("scroll", this._onScroll, { passive: true })
      this._handleScroll()
    }

    // On mobile: restore normal navbar while the menu is open
    this._collapse = this.element.querySelector(".navbar-collapse")
    if (this._collapse) {
      this._onCollapseShow = () => {
        this._menuOpen = true
        this.element.classList.remove("navbar-transparent")
      }
      this._onCollapseHide = () => {
        this._menuOpen = false
        if (this._onHeroPage) this._handleScroll()
      }
      this._collapse.addEventListener("show.bs.collapse", this._onCollapseShow)
      this._collapse.addEventListener("hide.bs.collapse", this._onCollapseHide)
    }
  }

  disconnect() {
    if (this._onScroll) {
      window.removeEventListener("scroll", this._onScroll)
    }
    if (this._collapse) {
      this._collapse.removeEventListener("show.bs.collapse", this._onCollapseShow)
      this._collapse.removeEventListener("hide.bs.collapse", this._onCollapseHide)
    }
  }

  _handleScroll() {
    if (this._menuOpen) return
    const scrolled = window.scrollY > 80
    this.element.classList.toggle("navbar-transparent", !scrolled)
    this.element.classList.toggle("navbar-scrolled", scrolled)
  }
}
