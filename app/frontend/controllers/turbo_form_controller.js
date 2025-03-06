import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit(event) {
    // Submit the closest form when a checkbox changes
    event.target.closest('form').requestSubmit()
  }
}
