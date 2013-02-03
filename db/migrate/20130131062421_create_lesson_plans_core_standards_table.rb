class CreateLessonPlansCoreStandardsTable < ActiveRecord::Migration
  def up
    create_table "lesson_plans_core_standards", :id => false, :force => true do |t|
      t.integer "lesson_plan_id"
      t.integer "core_standard_id"
    end
  end

  def down
    remove_column :lesson_plans_core_standards
  end
end
