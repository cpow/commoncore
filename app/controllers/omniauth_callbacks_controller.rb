class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stripe_connect
    if !current_user.stripe_connect
      callback = OmniauthCallbackCreator.new({user: current_user, \
        params: request.env["omniauth.auth"]})
      if callback.save
        redirect_to root_path, notice: 'Thank you! You have successfully linked your account with stripe!
        Now you can sell your lesson plans with ease!'
      else
        redirect_to root_path, alert: 'There was an error when linking your account with stripe.
        Please make sure your credentials are correct and try again in a few minutes.'
      end
    else
        redirect_to root_path, notice: 'You have already linked your account with stripe, thank you!'
    end
  end
end
