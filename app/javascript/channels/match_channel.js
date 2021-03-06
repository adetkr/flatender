import consumer from "./consumer";

const initMatchCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.matchid;
    consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
      received(data) {
        // called when data is broadcast in the cable
        console.log(data);
        messagesContainer.insertAdjacentHTML('beforeend', data.message);
        const user_id = messagesContainer.dataset.userid;
        console.log(user_id, data.user_id);
        if (user_id == data.user_id) {
          const messages = messagesContainer.querySelectorAll(".message");
          const lastMessage = messages[messages.length-1];
          lastMessage.classList.add("sent-message-container");
          console.log(lastMessage);
          const messageContent = document.querySelectorAll(".message-content");

        }
        window.scrollTo(0, document.body.offsetHeight);
        const messageContent = document.getElementById('message_content');
        messageContent.value = "";


      },
    });
  }
}

export { initMatchCable };
