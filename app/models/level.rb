class Level < ActiveRecord::Base
  belongs_to :core_standard
  belongs_to :grade_level
end
