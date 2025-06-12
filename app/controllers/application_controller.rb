class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  helper_method :current_user

  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
