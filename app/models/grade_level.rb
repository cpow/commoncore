class GradeLevel < ActiveRecord::Base
  #belongs_to :levelable, :polymorphic => true
  has_many :levels
  has_many :core_standards, :through => :levels

  scope :for_level, ->(level){where("level = ?", level)}
end
