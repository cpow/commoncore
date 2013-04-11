class OmniauthCallbackCreator
  attr_reader :params, :user
  def initialize(opts={})
    @params = opts[:params].with_indifferent_access
    @user = opts[:user]
  end

  def create
    send(@params[:provider])
  end

  private

    def stripe_connect
      StripeConnect.create!(
        user_id: @user.id,
        uid: @params[:uid],
        scope: @params[:info][:scope],
        livemode: @params[:info][:livemode],
        stripe_publishable_key: @params[:info][:stripe_publishable_key],
        token: @params[:credentials][:token],
        expires: @params[:credentials][:expires]
        )
    end
end