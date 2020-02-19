class SearchesController < ApplicationController
  def index
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
    @condition = Condition.all
    @delivery_charge = DeliveryCharge.all
  end

  private
  def search_params
    params.require(:q).permit(:product_name_cont, :sorts)
  end
end
