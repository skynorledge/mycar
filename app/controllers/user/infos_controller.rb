class User::InfosController < ApplicationController

  #before_action :authenticate_customer!, except: [:show,:edit]

  def confirm

    @user = current_customer

  end

  def withdrawal

    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path

  end

  def show

    @user = User.find(params[:id])

  end


  def edit

    @user = current_user

  end


  def update

    @user = current_user
    @user.update(user_params)

    @user.save

    flash[:notice] = "会員情報を更新しました"

    redirect_to mypage_path

  end


  private
    def user_params
      params.require(:user).permit(:name,:introduction,:email,:encrypted_password,
      :profile_image)
    end

end
