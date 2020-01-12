class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @condition = Condition.all
    @category = Category.all
    @delivery_charge = DeliveryCharge.all
    @delivery_way = DeliveryWay.all
    @prefecture = Prefecture.all
    @delivery_days = DeliveryDays.all
  end

end
