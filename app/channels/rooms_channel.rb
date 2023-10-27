# app/channels/rooms_channel.rb
class RoomsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "room_#{params[:room_id]}"
    end
  
    def unsubscribed
      # Any cleanup needed when the channel is unsubscribed
    end
  end
  