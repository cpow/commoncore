class HomeController < ApplicationController
  before_filter :only_admin_user

  def index
    @user = current_user
    @lesson_plans = @user.lesson_plans
    @posts =  @user.has_role?(:blogger) ? @user.posts : []
    @admin_posts =  @user.has_role?(:admin) ? Post.all : []
  end
end
