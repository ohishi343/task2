class RoomsController < ApplicationController
  before_action :move_to_root, except: [:index, :show]
  
  def index
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params.merge(user_id: current_user.id))
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to rooms_posts_path
    else
      render "new", status: :unprocessable_entity
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
  
  def room_params
    params.require(:room).permit(:name, :content, :price, :address, :image)
  end
  
  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
