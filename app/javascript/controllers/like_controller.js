import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import { initSweetalert } from '../plugins/init_sweetalert';



export default class extends Controller {
  connect() {
    console.log('Hello like controller');
    initSweetalert('#not-connected', {
      title: "Vous n'êtes pas connectés",
      text: "Vous devez vous connecter avant de pouvoir liker des appartements",
      icon: "error"
    });
     initSweetalert('#match-modal', {
      title: "Match !",
      text: "Vous venez d'avoir un match avec cet appartement",
      icon: "success",
 showCloseButton: true,
  showCancelButton: true,
  focusConfirm: false,
  confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> Great!',
  confirmButtonAriaLabel: 'Thumbs up, great!',
  cancelButtonText:
    '<i class="fa fa-thumbs-down"></i>',
  cancelButtonAriaLabel: 'Thumbs down'
    });

  }

  dislikeFlat(event) {

  }

  likeFlat(event) {

    const userId = event.target.dataset.userId;
    const flatId = event.target.dataset.flatId;

    fetchWithToken("/likes", {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ like: { user_id: userId, flat_id: flatId }})
    })
      .then(response => response.json())
      .then((data) => {
            event.target.disabled = true;
            event.target.innerText = "LIKED";
        if (data.match_exist) {
          const button = document.querySelector("#match-modal");
          button.click();
        }

      })
      .then((error) => {
        console.log(error);
      });

  }
}
