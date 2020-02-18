class PurchasesController < ApplicationController
  require 'payjp'

  before_action :set_product_card, only: [:show, :done]
  
  def show
    redirect_to root_path if @product.user.id == current_user.id
  end

  def pay
    card = current_user.card
    product = Product.find(params[:id])
    if product.selling_status_id === "1"
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
        Payjp::Charge.create(
          amount: product.price,
          customer: card.customer_id,
          currency: 'jpy'
        )
        product.update(selling_status_id: 3)
        redirect_to action: 'done'
    else
      @product = Product.find(params[:id])
      redirect_to action: 'show'
    end
  end

  def done
  end

  def set_product_card
    @product = Product.find(params[:id])
    @card = current_user.card
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end
end
