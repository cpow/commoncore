class AddUidToStripeConnect < ActiveRecord::Migration
  def change
    add_column :stripe_connects, :uid, :string
  end
end
