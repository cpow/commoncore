class CreateCoreStandards < ActiveRecord::Migration
  def change
    create_table :core_standards do |t|
      t.text :statement
      t.string :docref_id
      t.string :guid
      t.string :uri
      t.string :related_id

      t.timestamps
    end
  end
end
