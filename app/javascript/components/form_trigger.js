const triggerForm = (scooterForm) => {
  if (scooterForm.classList.contains('d-none')) {
    scooterForm.classList.remove('d-none')
  } else {
    scooterForm.classList.add('d-none')
  }
}

export { triggerForm };
