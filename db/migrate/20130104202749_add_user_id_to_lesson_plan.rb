class AddUserIdToLessonPlan < ActiveRecord::Migration
  def change
    add_column :lesson_plans, :user_id, :integer
  end
end
