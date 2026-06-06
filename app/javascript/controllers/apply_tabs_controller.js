import { Controller } from "@hotwired/stimulus"

// Apply page tab switcher
// Reads the URL hash on connect so external links can target a specific tab:
//   /apply          → defaults to "sponsor" tab
//   /apply#trainee  → opens "trainee" tab
export default class extends Controller {
  static targets = ["tab", "panel"]

  connect() {
    const hash = window.location.hash.replace("#", "") || "sponsor"
    this._activate(hash)
  }

  switch(event) {
    const tab = event.currentTarget.dataset.tab
    this._activate(tab)
    history.replaceState(null, "", `#${tab}`)
  }

  _activate(tab) {
    this.tabTargets.forEach(el => {
      el.classList.toggle("active", el.dataset.tab === tab)
    })
    this.panelTargets.forEach(el => {
      el.hidden = el.dataset.panel !== tab
    })
  }
}
