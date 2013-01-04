class LessonPlan < ActiveRecord::Base
  attr_accessible :description, :lesson_plan_file, :name
  belongs_to :user
  mount_uploader :lesson_plan_file, LessonPlanFileUploader
end