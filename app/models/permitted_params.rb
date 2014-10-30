class PermittedParams < Struct.new(:params)
  LESSON_PLAN_PARAMS = [
    :id,
    :description,
    :name,
    :lesson_plan_file,
    :created_at,
    :updated_at,
    :user_id,
    :objectives,
    :agenda,
    :materials,
  ]
end
