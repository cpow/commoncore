require "spec_helper"

describe PolymorphicObjectBuilder, '#find_polymorphic_object' do
  it 'should find the polymorphic object after being instantiated' do
    user = create_logged_in_user
    lesson_plan = create :lesson_plan, user: user

    product_params = {
     action: "new",
     controller: "product",
     user_id: user.id,
     lesson_plan_id: lesson_plan.id
    }

    object_builder = PolymorphicObjectBuilder.new product_params, "products"

    expect(object_builder.params).to eq product_params
    expect(object_builder.method).to eq "products"
    expect(object_builder.find_polymorphic_object).to eq lesson_plan
  end
end
