class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :origin

      t.timestamps
    end
  end
end
