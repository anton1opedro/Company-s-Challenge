module SeatsHelper
    def seat_status(seat)
      case seat.status
      when 'livre'
        'livre'
      when 'reservado'
        'reservado'
      when 'selecionado'
        'selecionado'
      when 'selecionado_por_outro'
        'selecionado_por_outro'
      end
    end

    def seat_color(seat)
        case seat.status
        when 'livre'
          'green'
        when 'reservado'
          'red'
        when 'selecionado'
          'lightgrey'
        when 'selecionado_por_outro'
          'lightcoral'
        end
      end
  end
  