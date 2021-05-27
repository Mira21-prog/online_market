class OmniauthCallbacksController < ApplicationController

  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"])
          .first_or_initialize(email: auth["info"]["email"])
    user.first_name ||= auth["info"]["first_name"]
    user.last_name ||= auth["info"]["last_name"]
    user.phone_number ||= "1616166161"
    user.password ||= Devise.friendly_token[0,20]
    user.type ||= 'Buyer'
    user.save!
    sign_in(:user, user)
    redirect_to after_sign_in_path_for(user)
  end
end
