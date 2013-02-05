class GradeLevel < ActiveRecord::Base
  attr_accessible :level, :levelable_type, :levelable_id, :id, :created_at, :updated_at

  #belongs_to :levelable, :polymorphic => true
  has_many :levels
  has_many :core_standards, :through => :levels

  scope :for_level, ->(level){where("level = ?", level)}
end
