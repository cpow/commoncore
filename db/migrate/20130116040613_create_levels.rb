class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :grade_level_id
      t.integer :core_standard_id

      t.timestamps
    end
  end
end
