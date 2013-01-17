class RemoveLevelableTypeAndLevelableIdFromGradeLevels < ActiveRecord::Migration
  def up
    remove_column :grade_levels, :levelable_type
    remove_column :grade_levels, :levelable_id
  end

  def down
    add_column :grade_levels, :levelable_id
    add_column :grade_levels, :levelable_type
  end
end
