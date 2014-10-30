class LessonPlan < ActiveRecord::Base
  belongs_to :user
  mount_uploader :lesson_plan_file, LessonPlanFileUploader
  has_many :comments, :as => :commentable
  has_and_belongs_to_many :core_standards
  has_many :products, :as => :productable

  validates :name,
    :description,
    :core_standards,
    :objectives,
    :agenda,
    :materials, presence: true
end
