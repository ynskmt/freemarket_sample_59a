class CardsController < ApplicationController
  require 'payjp'

  def new
  end

  def new_card
  end
  
  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new_card"
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      path = Rails.application.routes.recognize_path(request.referer)
      if @card.save
        if path[:controller] == "cards" && path[:action] == "new"
          redirect_to controller: :users, action: :done
        elsif path[:controller] == "cards" && path[:action] == "new_card"
          redirect_to controller: :mypages, action: :card
        end
      else
        redirect_to action: "new_card"
      end
    end
  end

  def destroy
    @card = current_user.card
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to controller: :mypages, action: :card
  end
end
