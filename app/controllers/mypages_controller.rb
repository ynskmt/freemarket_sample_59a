class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def profile
    @user = User.new
  end

  def update_profile
    @user = User.find(params[:id])
    if @user.id == current_user.id
      current_user.update(user_params)
      redirect_to profile_mypage_path(current_user.id)
    else
      redorect_to profile_mypage_path(current_user.id)
    end
  end

  def identification
    @address = Address.new
  end

  def update_identification
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to identification_mypage_path
    else
      redirect_to identification_mypage_path
    end
  end

  def listing
    @products = current_user.products
  end

  def card
    @card = current_user.card
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end


  private
  def user_params
    params.require(:user).permit(:nickname)
  end

  def address_params
    params.require(:address).permit(:zip_code, :prefecture, :city, :block_num, :building_name).merge(user_id: current_user.id)
  end

end