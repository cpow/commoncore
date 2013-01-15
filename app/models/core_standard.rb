class CoreStandard < ActiveRecord::Base
  attr_accessible :docref_id, :guid, :related_id, :statement, :uri, :id, :created_at, :updated_at, :dot_notation

  has_many :grade_levels, :as => :levelable
end
