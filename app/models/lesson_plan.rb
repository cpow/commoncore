class LessonPlan < ActiveRecord::Base
  attr_accessible :description, :lesson_plan_file, :name, :core_standards_attributes
  belongs_to :user
  mount_uploader :lesson_plan_file, LessonPlanFileUploader

  validates :name, :description, presence: true
  has_many :comments, :as => :commentable
  has_and_belongs_to_many :core_standards
  accepts_nested_attributes_for :core_standards
end