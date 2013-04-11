class CreateStripConnects < ActiveRecord::Migration
  def change
    create_table :strip_connects do |t|
      t.integer :user_id
      t.boolean :livemode
      t.string :scope
      t.string :stripe_publishable_key
      t.string :token
      t.boolean :expires

      t.timestamps
    end
  end
end
