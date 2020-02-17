class PurchasesController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @card = current_user.card
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end
end
