class RemoveLevableTypeAndAddLevelableTypeToGradeLevels < ActiveRecord::Migration
  def up
    remove_column :grade_levels, :levable_type
    add_column :grade_levels, :levelable_type, :string
  end

  def down
    remove_column :grade_levels, :levelable_type
    add_column :grade_levels, :levable_type, :string
  end
end
