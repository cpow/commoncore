require 'spec_helper'

describe Api::RemoveCoreStandardFromLessonPlansController do
  it 'should do something' do
    lp = create :lesson_plan

    post :create,
      id: lp.core_standards.first.id,
      lesson_plan_id: lp.id

    lesson_plan = LessonPlan.first

    expect(lesson_plan.core_standards.present?).to_not be
  end
end
