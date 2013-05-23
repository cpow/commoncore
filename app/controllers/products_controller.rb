class ProductsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @product = Product.new
    @productable = PolymorphicObjectBuilder.new(params, "products").find_polymorphic_object
  end

  def create
    @productable = PolymorphicObjectBuilder.new(params, "products").find_polymorphic_object
    @product = @productable.products.build(params[:product])
    respond_to do |format|
      if @product.save
        format.json {render json: @product, status: :created, location: @product}
        format.html {redirect_to user_lesson_plans_path(current_user), notice: "Product was successfully created"}
      else
      end
    end
  end
end
