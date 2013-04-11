class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    callback = OmniauthCallbackCreator.new({user: current_user, \
      params: request.env["omniauth.auth"]})
  end
end