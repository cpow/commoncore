class OmniauthCallbackCreator
  attr_reader :params, :user
  def initialize(opts={})
    @params = opts[:params].with_indifferent_access
    @user = opts[:user]
  end

  def save
    @object = send(@params[:provider])
    @object.save
  end

  private

    def stripe_connect
      StripeConnect.new(
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