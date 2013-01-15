class AddDotNotationToCoreStandard < ActiveRecord::Migration
  def change
    add_column :core_standards, :dot_notation, :string
  end
end
