class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    unless current_user.stripe_connect
      callback = OmniauthCallbackCreator.new({user: current_user, \
        params: request.env["omniauth.auth"]}).create
    end
  end
end