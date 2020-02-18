class CardsController < ApplicationController
  require 'payjp'

  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        path = Rails.application.routes.recognize_path(request.referer)
        if path[:controller] == "cards" && path[:action] == "new"
          redirect_to controller: :users, action: :done
        else
          redirect_to done_users_path
        end
      else
        redirect_to action: "pay"
      end
    end
  end
end
