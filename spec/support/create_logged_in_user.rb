require 'spec_helper'


module SpecHelpers
  def create_logged_in_user
    user = FactoryGirl.create :user
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end

  def create_logged_in_user_with_lesson_plan
    user = create_logged_in_user
    FactoryGirl.create :lesson_plan, user: user
  end
end
