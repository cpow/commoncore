class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    @callback = request.env["omniauth.auth"].to_yaml
  end
end