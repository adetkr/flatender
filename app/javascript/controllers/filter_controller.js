import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "min_price", "max_price", "min_surface", "max_surface", "min_rooms", "max_rooms", "submit",
    "formMin_price", "formMax_price", "formMin_surface", "formMax_surface", "formMin_rooms", "formMax_rooms", "formCity"
]

  connect() {
    console.log("texte")
  }

  saveSearch() {
    this.formMin_priceTarget.value = this.formMin_priceTarget.value; 
    this.formMax_priceTarget.value = this.formMax_priceTarget.value;
    this.formMin_surfaceTarget.value = this.formMin_surfaceTarget.value;
    this.formMax_surfaceTarget.value = this.formMax_surfaceTarget.value;
    this.formMin_roomsTarget.value = this.formMin_roomsTarget.value;
    this.formMax_roomsTarget.value = this.formMax_roomsTarget.value;
    this.formCityTarget.value = document.querySelector("#flat_address").value;
    this.submitTarget.click();
    event.currentTarget.innerText = "Search Saved !"
  }
}
