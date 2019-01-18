class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    byebug
    if params[:q]
      search_term = params[:q]
      # return our filtered list here
      # @products = Product.where("name LIKE ?", "%#{search_term}%")
      if Rails.env.production?
        logger.debug "before: in production search for product name in db"
        @products = Product.where("name ILIKE ?", "%#{search_term}%")
        logger.debug "after: in production search for product name in db"
      else
        logger.debug "before: in test and dev search for product name in db"
        @products = Product.where("name LIKE ?", "%#{search_term}%")
        logger.debug "after: in test and dev search for product name in db"

      end
    else
      @products = Product.all
    end
  end

  def hello
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    logger.debug "before sorting and paginating"
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
    logger.debug "after sorting and paginating"

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def test
    redirect_to "/simple_pages/landing_page"
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    logger.debug "Product new performed"
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        logger.debug "Product saved"

      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        logger.debug "Product not saved"

      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :prize, :quantity)
    end
end
