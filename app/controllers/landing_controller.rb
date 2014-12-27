class LandingController < ApplicationController
  def index
    if current_user
      redirect_to user_lesson_plans_path(
        user_id: current_user.id)
    end
  end
end
