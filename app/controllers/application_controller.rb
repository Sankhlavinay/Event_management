class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!


  private

  def authorized_organizer
    if user_signed_in? && current_user.organizer?
      events_path
    else
      redirect_to events_path, notice: "You are not authorized to access"
    end
  end
end
