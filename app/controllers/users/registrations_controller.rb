# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  require 'payjp'
  def new
    @user = User.new
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    render :sms_authentication
  end

  def sms_authentication_create
    session["devise.regist_data"]["user"]["phone_num"] = params[:user][:phone_num]
    @user = User.new(session["devise.regist_data"]["user"])
    unless session["devise.regist_data"]["user"]["phone_num"].present?
      flash.now[:alert] = @user.errors.full_messages
      render :sms_authentication and return
    end
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    session["devise.regist_data1"] = {address: @address.attributes}
    @card = @user.build_card
    render :new_card
  end

  def create_card
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(session["devise.regist_data1"]["address"])
    # @card = Card.new(card_params)
    @user.build_address(@address.attributes)
    # @user.build_card(@card.attributes)
    @user.save
    sign_in(:user, @user)
    # if @user.save
    #   session[:id] = @user.id
    #   sign_in User.find(session[:id]) unless user_signed_in?
    #   #後にcurrent_user.idが必要なので、signinさせてしまう
    # else
    #   render '/users'
    # end
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp_token'].blank?
      render '/cards'
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card,
        expiration_month: customer.cards.data[0].exp_month,
        expiration_year: customer.cards.data[0].exp_year
      )
      unless @card.valid?
        flash.now[:alert] = @card.errors.full_messages
        render :new_card and return
      end
      @card.save
    end
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def address_params
    params.require(:address).permit(:last_name,  :first_name, :last_name_kana, :first_name_kana, :zip_code, :prefecture, :city, :block_num, :building_name, :phone_num)
  end

  def card_params
    params.require(:card).permit(:card_num, :expiration_month, :expiration_year, :customer_id, :card_id)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end