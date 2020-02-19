class SearchesController < ApplicationController
  def index
    @condition = Condition.all
    @delivery_charge = DeliveryCharge.all
  end
end
