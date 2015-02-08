class Api::RemoveCoreStandardFromLessonPlansController < ApplicationController
  respond_to :json

  def create
    @lesson_plan = LessonPlan.find(params[:lesson_plan_id])
    @core_standard = CoreStandard.find(params[:id])
    @lesson_plan.core_standards.delete(@core_standard)
    render json: '{}', code: 200
  end
end
