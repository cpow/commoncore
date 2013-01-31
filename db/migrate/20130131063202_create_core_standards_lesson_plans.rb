class CreateCoreStandardsLessonPlans < ActiveRecord::Migration
  def up
    create_table "core_standards_lesson_plans", :id => false, :force => true do |t|
      t.integer "lesson_plan_id"
      t.integer "core_standard_id"
    end
  end

  def down
  end
end
