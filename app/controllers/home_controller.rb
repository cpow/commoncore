class HomeController < ApplicationController
  before_filter :only_admin_user

  def index
    @user = current_user
    @lesson_plans = current_user.lesson_plans
    @posts = Post.all
  end
end
