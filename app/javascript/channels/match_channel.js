import consumer from "./consumer";

const initMatchCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.matchid;
    consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
      received(data) {
        // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initMatchCable };
