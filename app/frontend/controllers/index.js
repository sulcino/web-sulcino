import { Application } from "@hotwired/stimulus"
import TurboFormController from "./turbo_form_controller"

const application = Application.start()
application.register("turbo-form", TurboFormController)
