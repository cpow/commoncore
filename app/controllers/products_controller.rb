class ProductsController < ApplicationController
  before_filter :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    @products = current_user.products

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = current_user.products.detect{params[:id]}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @productable = PolymorphicObjectBuilder.new(params, "product").find_polymorphic_object

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @productable = PolymorphicObjectBuilder.new(params, "product").find_polymorphic_object
    @product = Product.new(productable_type: @productable.class.name.underscore, productable_id: @productable.id, price: params[:product][:price], user_id: params[:product][:user_id])

    respond_to do |format|
      if @product.save
        format.html { redirect_to polymorphic_url(@productable), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

end
