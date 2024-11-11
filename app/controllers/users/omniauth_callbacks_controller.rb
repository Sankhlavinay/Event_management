# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user,event: :authetication,
       notice: "Successfully authenticated from Google account."
    else
      redirect_to new_user_registration_url, alert: @user.errors.full_messages
    end
  end
end
