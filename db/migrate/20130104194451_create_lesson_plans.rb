class CreateLessonPlans < ActiveRecord::Migration
  def change
    create_table :lesson_plans do |t|
      t.string :name
      t.string :description
      t.string :lesson_plan_file

      t.timestamps
    end
  end
end
