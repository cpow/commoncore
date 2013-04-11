class OmniauthCallbackCreator
  attr_reader :params, :user
  def initialize(opts={})
    @params = opts[:params]
    @user = opts[:user]
  end
end