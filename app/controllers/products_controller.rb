class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @condition = Condition.all
    # @category = Category.all
    @category = []
    Category.where(ancestry: nil).each do |parent|
    @category << parent
    end
    @delivery_charge = DeliveryCharge.all
    @delivery_way = DeliveryWay.all
    @prefecture = Prefecture.all
    @delivery_days = DeliveryDays.all
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
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :product_name,
      :product_description,
      :category_id,
      :condition,
      :delivery_charge,
      :delivery_way,
      :delivery_area,
      :delivery_days,
      :price,
      images_attributes: [:image])
      .merge(user_id: current_user.id)
  end

end
