class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_player

  def set_current_player
    @current_player = Token.find_by_token(params[:token]).try(:player)
  end
end
