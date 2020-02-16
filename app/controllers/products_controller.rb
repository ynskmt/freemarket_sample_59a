class ProductsController < ApplicationController
  before_action :set_product, only: [:detail, :show]
  before_action :set_category, only: [:new, :edit]

  def index
    @ladies = Product.where(category_id:1..199).order("created_at DESC").limit(10)
    @mens = Product.where(category_id:200..345).order("created_at DESC").limit(10)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def category_children
    children = Category.find(params[:name]).name
    @category_children = Category.find_by(name: children, ancestry: nil ).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.valid? && params[:images].present?
      @product.save
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if params[:images][:image].nil?
      redirect_to detail_product_path(@product.id)
    elsif @product.update(product_params)
      exist_ids = @product.images.pluck(:id)
      params[:images][:image].each do |image|
        if image.is_a?(String)
          exist_ids.delete(image.to_i)
        else
          render :edit unless @product.images.create(image: image, product_id: @product.id)
        end
      end
      exist_ids.each do |id|
        delete_image = Image.find(id)
        delete_image.delete
      end
    else
      redirect_to root_path
    end
  end

  def get_image
    @images = Product.find(params[:product_id]).images
  end

  def show
  end


  private
  def product_params
    params.require(:product).permit(
      :product_name,
      :product_description,
      :category_id,
      :condition_id,
      :delivery_charge_id,
      :delivery_way_id,
      :delivery_area_id,
      :delivery_days_id,
      :price,
      images_attributes: [:image])
      .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
    @grandchild = Category.find(@product[:category_id])
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def set_category
    @condition = Condition.all
    @category = Category.where(ancestry: nil)
    @delivery_charge = DeliveryCharge.all
    @delivery_way = DeliveryWay.all
    @delivery_area = DeliveryArea.all
    @delivery_days = DeliveryDays.all
  end

end
