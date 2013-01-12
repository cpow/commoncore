class AddLevelableIdAndLevelableTypeToGradeLevel < ActiveRecord::Migration
  def change
    add_column :grade_levels, :levelable_id, :integer
    add_column :grade_levels, :levable_type, :string
  end
end
