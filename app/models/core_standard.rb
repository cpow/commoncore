class CoreStandard < ActiveRecord::Base
  attr_accessible :docref_id, :guid, :related_id, :statement, :uri, :id, :created_at, :updated_at, :dot_notation, :grade_levels

  has_many :levels
  has_many :grade_levels, :through => :levels
  accepts_nested_attributes_for :grade_levels
end
