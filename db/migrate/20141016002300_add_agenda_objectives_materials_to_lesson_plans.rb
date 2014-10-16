class AddAgendaObjectivesMaterialsToLessonPlans < ActiveRecord::Migration
  def change
    add_column :lesson_plans, :objectives, :text, default: ''
    add_column :lesson_plans, :agenda, :text, default: ''
    add_column :lesson_plans, :materials, :text, default: ''
  end
end
