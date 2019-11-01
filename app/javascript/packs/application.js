import "bootstrap";
import {datePicker} from "../plugins/init_flatpickr"
import {initAutocomplete} from "../plugins/init_autocomplete"
import "flatpickr/dist/flatpickr.min.css"
import { calculatePrice } from "../plugins/price_calculator"
import { triggerForm } from '../components/form_trigger';
datePicker()
initAutocomplete()
calculatePrice()

const editButtons = document.querySelectorAll('.botton-edit i');
const scooterForms = Array.from(document.querySelectorAll('.scooter-edit-form'))
editButtons.forEach(btn => {
  btn.addEventListener('click', e => {
    const form = scooterForms.find(form => form.id === `scooter-form-${btn.dataset.id}`)
    triggerForm(form);
  })
})
