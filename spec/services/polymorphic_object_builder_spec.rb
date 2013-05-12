require "spec_helper"

describe PolymorphicObjectBuilder do

  let(:lesson_plan){FactoryGirl.create(:lesson_plan, user: user)}
  let(:user){create_logged_in_user}

  before(:each){lesson_plan}

  let(:product_params){
   { action: "new",
   controller: "product",
   user_id: user.id,
   lesson_plan_id: lesson_plan.id}
  }

  subject{PolymorphicObjectBuilder.new(product_params, "product")}

  describe ".new" do
    specify{subject.params.should eql(product_params)}
    specify{subject.method.should eql("product")}
  end
  
  describe ".find_polymorphic_object" do
    specify{subject.find_polymorphic_object.should eql(lesson_plan)}
  end

end
