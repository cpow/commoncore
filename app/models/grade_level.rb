class GradeLevel < ActiveRecord::Base
  attr_accessible :level, :levelable_type, :levelable_id, :id, :created_at, :updated_at

  belongs_to :levelable, :polymorphic => true
end
