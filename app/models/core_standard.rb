class CoreStandard < ActiveRecord::Base
  attr_accessible :docref_id, :guid, :related_id, :statement, :uri, :id, :created_at, :updated_at, :dot_notation, :grade_levels

  has_many :levels
  has_many :grade_levels, :through => :levels
  has_and_belongs_to_many :lesson_plans
  accepts_nested_attributes_for :grade_levels

  scope :for_subject, ->(subject){where("dot_notation LIKE ?", "%#{subject}%")}

  def self.with_level_and_subject(level, subject)
    GradeLevel.for_level(level).includes(:core_standards).first.core_standards.for_subject(subject)
  end
end
