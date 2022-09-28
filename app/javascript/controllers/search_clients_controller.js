import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-clients"
export default class extends Controller {
  static targets = ["form", "input", "list", "searchParam"]

  connect() {}

  update(){
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&&search=${this.searchParamTarget.value.toLowerCase()}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }
}
