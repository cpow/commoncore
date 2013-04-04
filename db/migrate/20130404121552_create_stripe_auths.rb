class CreateStripeAuths < ActiveRecord::Migration
  def change
    create_table :stripe_auths do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
