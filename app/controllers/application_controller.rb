class ApplicationController < ActionController::Base
  protect_from_forgery

  def assert_current_user
    unless current_user
      redirect_to new_user_session_path
      flash[:alert] = "You need to sign in before you can do that."
    end
  end

  def assert_baker
    unless current_user && current_user.pies.include?(@pie)
      redirect_to root_path
    end
  end

end
