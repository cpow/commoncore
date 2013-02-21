class HomeController < ApplicationController
  def index
    @user = current_user
    @lesson_plans = current_user.lesson_plans
    @posts = Post.all
  end
end
