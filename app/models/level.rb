class Level < ActiveRecord::Base
  attr_accessible :core_standard_id, :grade_level_id

  belongs_to :core_standard
  belongs_to :grade_level
end
