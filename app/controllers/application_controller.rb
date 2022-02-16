class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image])
  end
  
  def set_q
    @q = Room.ransack(params[:q])
  end
end
