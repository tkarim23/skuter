import "bootstrap";
import {datePicker} from "../plugins/init_flatpickr"
import {initAutocomplete} from "../plugins/init_autocomplete"
import "flatpickr/dist/flatpickr.min.css"
import { calculatePrice } from "../plugins/price_calculator"
datePicker()
initAutocomplete()
calculatePrice()
