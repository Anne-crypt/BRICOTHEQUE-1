const hideAlert = () => {

  const hideButton = document.getElementById('button-box');
  const tohiddenArea = document.querySelector('.confirm');
  if (hideButton) {
    hideButton.addEventListener('click', function () {
      tohiddenArea.style['visibility']='hidden';
      console.log("hi");
      });
  };
};

export { hideAlert };
