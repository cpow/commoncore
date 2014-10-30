class StripeConnect < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :uid, :scope, :stripe_publishable_key, :token, :presence => true
end
