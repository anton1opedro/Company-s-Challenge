class AddRoomToSeats < ActiveRecord::Migration[7.1]
  def change
    add_reference :seats, :room, null: false, foreign_key: true
  end
end
