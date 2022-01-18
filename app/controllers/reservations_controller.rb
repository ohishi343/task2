class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @sum = (@reservation.num_of_people * @reservation.room.price * @days).to_i
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約しました"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_of_people, :room_id, :user_id)
  end
end
