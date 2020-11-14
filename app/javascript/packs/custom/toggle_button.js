  (function() {
      var button = document.querySelector('.filter-button');
      var box = document.querySelector('.filter-offcanvas');
      button.addEventListener('click', function() {
        box.classList.toggle('show');
      });

    })();
