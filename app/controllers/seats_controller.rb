# app/controllers/seats_controller.rb
class SeatsController < ApplicationController
    def index
      @seats = Seat.all
    end
  
    def update
      @seat = Seat.find(params[:id])
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
      # @seat.update(status: 2)
      redirect_back(fallback_location: seats_path)
    end
  
    def reserve
      @seats = Seat.where(id: params[:ids])
    if @seats.any? { |seat| seat.reservado?}
        redirect_back(fallback_location: seats_path, alert: 'This seat is already reserved.')
      else
        @seats = Seat.where(status: 2)
        @seats.update_all(status: 1)
        redirect_to root_path
      end
    end

    # def select
    #   @seat = Seat.find(params[:id])
    #   if @seat.livre?
    #     @seat.update(status: 2)
    #     session[:selected_seat_id] = @seat.id
    #   else
    #     flash[:error] = 'This seat is already reserved!'
    #   end
    #   redirect_back(fallback_location: seats_path)
    # end
  
    private
  
    def seat_params
      params.require(:seat).permit(:status)
    end
  end
  