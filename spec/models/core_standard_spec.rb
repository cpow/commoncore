require 'spec_helper'

describe CoreStandard do
  before(:each){FactoryGirl.create :core_standard}
  describe ".for_subject(Math)" do
    specify{CoreStandard.for_subject("Math").count.should eql(1)}
  end
end
