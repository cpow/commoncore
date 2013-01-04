class HomeController < ApplicationController
  def index
    @user = current_user
    @lesson_plans = current_user.lesson_plans
  end
end
