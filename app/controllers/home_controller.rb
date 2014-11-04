class HomeController < ApplicationController

  def index
    @user = current_user
    @lesson_plans = @user.lesson_plans
    @posts =  @user.has_role?(:blogger) ? Post.all : []
  end
end
