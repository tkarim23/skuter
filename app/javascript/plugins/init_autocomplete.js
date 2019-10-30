import places from 'places.js';


const initAutocomplete = () => {
  console.log("i'm in the file")
  const addressInput = document.getElementById('location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
