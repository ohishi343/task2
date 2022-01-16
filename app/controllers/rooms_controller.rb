class RoomsController < ApplicationController
  before_action :move_to_root, except: [:index, :show]
  before_action :set_q, only: [:index, :search]
  
  def index
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:name, :content, :price, :address, :image).merge(user_id: current_user.id))
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to rooms_posts_path
    else
      render new_room_path, status: :unprocessable_entity
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def posts
    @rooms = Room.all
  end
  
  def search
    @results = @q.result
  end
  
  private
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
