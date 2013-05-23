class LessonPlan < ActiveRecord::Base
  attr_accessible :description, :lesson_plan_file, :name, :core_standards_attributes
  belongs_to :user
  mount_uploader :lesson_plan_file, LessonPlanFileUploader
  has_many :comments, :as => :commentable
  has_and_belongs_to_many :core_standards
  has_many :products, :as => :productable
  validates :name, :description, :core_standards, presence: true
end
