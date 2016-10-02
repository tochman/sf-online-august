class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?


  private
  def store_current_location
    store_location_for(:user, request.url)
  end

end
