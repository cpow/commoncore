require 'spec_helper'

describe LessonPlan do
  it {should validate_presence_of(:objectives)}
  it {should validate_presence_of(:agenda)}
  it {should validate_presence_of(:materials)}

  let(:lesson_plan){FactoryGirl.create :lesson_plan}

  context "entering correct information" do
    describe "#save" do
      specify{lesson_plan.should be_valid}
    end
  end
end
