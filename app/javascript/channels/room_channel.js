// app/javascript/channels/room_channel.js
import consumer from "channels/consumer"

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById('room-id')
  console.log(element)
  const room_id = element.getAttribute('data-room-id')
  console.log('Room ID:', room_id);

  consumer.subscriptions.create({ channel: "RoomsChannel", room_id: room_id }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data); // Display data in the console for now

      // Perform necessary actions on the UI based on received data
      const seatId = data.seat_id;
      const status = data.status;
      const userId = data.user_id;

      console.log(seatId);
      console.log(status);
      console.log(userId);

      // Example: Update the seat status on the UI
      var circle = document.getElementById('circle-'+seatId);
      var number = document.getElementById('circle-value-'+seatId)

      if (status === 'livre') {
          circle.classList.remove("selecionado", "reservado", "selecionado_por_outro");
          circle.classList.add("livre");
        circle.style.backgroundColor = 'green';
      } else if (status === 'selecionado') {
        if (userId === currentUserId) {
          circle.classList.remove("livre", "reservado", "selecionado_por_outro");
          circle.classList.add("selecionado");
          circle.style.backgroundColor = 'lightgray';
        } else {
          circle.classList.remove("selecionado", "reservado", "livre");
          circle.classList.add("selecionado_por_outro");
          circle.style.backgroundColor = 'lightcoral';
        }
      } else if (status === 'reservado') {
          circle.classList.remove("selecionado", "livre", "selecionado_por_outro");
          circle.classList.add("reservado");
          circle.style.backgroundColor = 'red';
      } else if (status === 'selected_by_other') {
        circle.style.backgroundColor = 'lightcoral';
      }
    }
  });
});
