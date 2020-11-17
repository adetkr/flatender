const showPanel = () => {
  var button = document.querySelector('.filter-button');
  var box = document.querySelector('.filter-offcanvas');
  if (button) {
    button.addEventListener('click', function() {
      box.classList.toggle('show');
    });
  }

}

const closePanel = () => {
  var button = document.querySelector('.close-filter-button');
  var box = document.querySelector('.filter-offcanvas');
  if (button) {
     button.addEventListener('click', function() {
      box.classList.toggle('show');
    });
  }

}

export { showPanel, closePanel };
