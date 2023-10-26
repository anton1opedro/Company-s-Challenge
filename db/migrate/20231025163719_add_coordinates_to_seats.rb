class AddCoordinatesToSeats < ActiveRecord::Migration[7.1]
  def change
    add_column :seats, :x, :integer
    add_column :seats, :y, :integer
  end
end
