class LessonPlan < ActiveRecord::Base
  attr_accessible :description, :lesson_plan_file, :name
  belongs_to :user
  mount_uploader :lesson_plan_file, LessonPlanFileUploader

  validates :name, :description, :lesson_plan_file, presence: true
  has_many :comments, :as => :commentable
  has_many :core_standards
end