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
    @product = @productable.products.build(params[:product])
  end

end
