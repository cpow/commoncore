class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :productable_type
      t.integer :productable_id
      t.decimal :price

      t.timestamps
    end
  end
end
