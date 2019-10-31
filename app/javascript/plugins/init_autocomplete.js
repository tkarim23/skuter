import places from 'places.js';


const initAutocomplete = () => {
  console.log("Autocomplete in the file")
  const addressInput = document.getElementById('location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
