class LessonPlanSaver
  attr_reader :params, :user, :lesson_plan
  def initialize(opts={})
    @params = opts[:params]
    @user = opts[:user]
    @lesson_plan = @user.lesson_plans.build(@params)
  end

  def save
    add_core_standards_from_params
    @lesson_plan.save
  end

  private

    def add_core_standards_from_params
      unless @params[:core_standard_ids].blank?
        @params[:core_standard_ids].each{|id| @lesson_plan.core_standards << CoreStandard.find(id)}
      end
    end
end
