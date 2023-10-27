# app/controllers/seats_controller.rb
class SeatsController < ApplicationController
  # include ActionController::Live

  def index
    @seats = Room.first.seats
  end

  def update
    @seat = Room.first.seats.find(params[:id])
    if @seat.reservado?
      flash[:error] = 'This seat is already reserved!'
    else
      if @seat.selecionado?
        @seat.livre!
      elsif @seat.livre?
        @seat.selecionado!
      end
      session[:selected_seat_id] = @seat.id
    end
    broadcast_seat_update(@seat)
    redirect_back(fallback_location: seats_path)
  end

  def reserve
    @seats = Room.first.seats.where(id: params[:ids])
  if @seats.any? { |seat| seat.reservado?}
      redirect_back(fallback_location: seats_path, alert: 'This seat is already reserved.')
    else
      @seats = Room.first.seats.where(status: 2)
      @seats.update_all(status: 1)
      @seats.each { |seat| broadcast_seat_update(seat) }
      redirect_to root_path
    end
  end

  # def stream
  #   response.headers['Content-Type'] = 'text/event-stream'
  #   sse = SSE.new(response.stream)
  #   loop do
  #     sse.write({ seats: Seat.all })
  #     sleep 1
  #   end
  # rescue ClientDisconnected
  # ensure
  #   response.stream.close
  # end

  private

  def seat_params
    params.require(:seat).permit(:status)
  end

  def broadcast_seat_update(seat)
    # ActionCable.server.broadcast("seat_channel", { seat_id: seat.id, status: seat.status })
    room_id = seat.room_id
    puts "Broadcasting to room_#{room_id}, Seat ID: #{seat.id}, Status: #{seat.status}"
    ActionCable.server.broadcast("room_#{room_id}", { seat_id: seat.id, status: seat.status })
  end
end
