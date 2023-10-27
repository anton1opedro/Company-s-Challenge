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

        console.log(seatId.toString());
        console.log(status);

        // Example: Update the seat status on the UI
        var circle = document.getElementById('circle-'+seatId);
        var number = document.getElementById('circle-value-'+seatId)
        if (circle) {
            circle.classList.remove("selecionado", "reservado", "selecionado_por_outro", "livre");
            if (status === "livre") {
                circle.classList.add("livre");
                circle.style.backgroundColor='green'
                console.log(circle.classList);
            } else if (status === "selecionado") {
                circle.classList.add("selecionado_por_outro");
                circle.style.backgroundColor='lightcoral'
                console.log(circle.classList);
            } else if (status === "reservado") {
                circle.classList.add("reservado");
                circle.style.backgroundColor='red'
                console.log(circle.classList);
            } else if (status === "selecionado_por_outro") {
              circle.classList.add("selecionado")
              circle.style.backgroundColor='gray'
              console.log(circle.classList);
            }
        }
      }
    });
  });
  