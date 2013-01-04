require 'spec_helper'

describe LessonPlan do
  let(:lesson_plan){FactoryGirl.create :lesson_plan}

  context "entering correct information" do
    describe "#save" do
      specify{lesson_plan.should be_valid}
    end
  end
end
