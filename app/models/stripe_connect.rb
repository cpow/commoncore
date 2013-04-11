class StripeConnect < ActiveRecord::Base
  attr_accessible :user_id, :uid, :scope, :livemode, :stripe_publishable_key, :token, :expires
  belongs_to :user
end
