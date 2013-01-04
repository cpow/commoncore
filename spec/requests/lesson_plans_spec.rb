require 'spec_helper'

describe "LessonPlans" do
  let(:user){create_logged_in_user}
  describe "GET /lesson_plans" do
    it "works! (now write some real specs)" do
      get user_lesson_plans_path(user_id: user.id)
      response.status.should be(200)
    end
  end
end
