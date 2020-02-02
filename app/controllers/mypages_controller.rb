class MypagesController < ApplicationController

  def index
  end

  def profile
    @user = User.new
  end

  def update_profile
    @user = User.find(params[:id])
    current_user.update(user_params)
    redirect_to profile_mypage_path(current_user.id)
  end


  private
  def user_params
    params.require(:user).permit(:nickname)
  end


end