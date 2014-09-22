class LessonPlanDashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lesson_plans = LessonPlan.order(:created_at)
  end
end
