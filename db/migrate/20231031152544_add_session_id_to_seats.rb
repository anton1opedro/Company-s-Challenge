class AddSessionIdToSeats < ActiveRecord::Migration[7.1]
  def change
    add_column :seats, :session_id, :string
  end
end
