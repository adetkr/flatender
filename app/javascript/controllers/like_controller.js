import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import { initSweetalert } from '../plugins/init_sweetalert';



export default class extends Controller {
  connect() {

    console.log('Hello like controller');

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
          const chatlink = document.querySelector("#matchpath");
          const matchname = document.querySelector("#matchName");

        if (data.match_exist) {
          console.log(chatlink.attributes.href);
          console.log(data.matchname);
          chatlink.setAttribute('href', `/matches/${data.matchid}`);

          matchname.innerText = `${data.matchname}`
          //button.click();
          $('#MatchModal').modal('show');
        }

      })
      .then((error) => {
        console.log("error");
        console.log(error);
      });

  }
}
