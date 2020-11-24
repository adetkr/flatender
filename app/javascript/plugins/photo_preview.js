const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {

    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}


const sendImageOnFileSelect = () => {
  // we select the photo input
  const image = document.getElementById('message-image');
  if (image) {

    // we add a listener to know when a new picture is uploaded
    image.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      const submitButton = document.getElementById('submit-message');
      console.log("here");
      submitButton.click();
      image.value = "";
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {

      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect, sendImageOnFileSelect };
