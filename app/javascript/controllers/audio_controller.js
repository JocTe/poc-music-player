import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="audio"
export default class extends Controller {
  static values = {
    url: String,
  };

  connect() {
    this.audio = new Audio();
    this.audio.src = this.urlValue;
  }

  toggle(e) {
    if (!this.audio.paused) {
      this.audio.pause();
    } else {
      this.audio.play();
    }
  }
}
