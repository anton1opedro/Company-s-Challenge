class Seat < ApplicationRecord
    belongs_to :room

    enum status: { livre: 0, reservado: 1, selecionado: 2, selecionado_por_outro: 3 }
    validates :x, :y, :room_id, presence: true
end
