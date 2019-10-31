import places from 'places.js';


const initAutocomplete = () => {
  console.log("Autocomplete in the file")
  const addressInput = document.getElementById('location');
  if (addressInput) {
    places({
      container: addressInput,
      appId: 'pl7ZSWRFNSQL',
      apiKey: '15acf6002782b08b3d9c5709b72b14bb'
    });
  }
};

export { initAutocomplete };
