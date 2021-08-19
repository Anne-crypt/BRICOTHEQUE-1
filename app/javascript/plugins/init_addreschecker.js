

const createNewAddress = () => {

  const addressCheckboxInput = document.getElementById('user_address_checking');
  const addresInput = document.querySelector('.tool_address');
  addresInput.classList.add('d-none')
  if (addressCheckboxInput) {
    addressCheckboxInput.addEventListener('click', function () {
      if (addressCheckboxInput.checked) {
          addresInput.classList.remove('d-none');
      }
      else {
          addresInput.classList.add('d-none');

      }
    });
  }
};

export { createNewAddress };
