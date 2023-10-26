class Seat < ApplicationRecord
    enum status: { livre: 0, reservado: 1, selecionado: 2, selecionado_por_outro: 3 }

    validates :x, :y, presence: true
end
