import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-clients"
export default class extends Controller {
  static targets = ["form", "input", "list", "searchParam"]

  connect() {
    console.log("hello")
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
    console.log(this.searchParamTarget)
  }

  update(){
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&&search=${this.searchParamTarget.value.toLowerCase()}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }
}
