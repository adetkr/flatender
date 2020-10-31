import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  connect() {
    console.log('Hello like controller');
  }

  likeFlat(event) {
    console.log(event.target.dataset);
    const userId = event.target.dataset.userId;
    const flatId = event.target.dataset.flatId;
    event.target.disabled = true;
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
        console.log(data);
      })
      .then((error) => {
        console.log(error);
      });

  }
}
