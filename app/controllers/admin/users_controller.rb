class Admin::UsersController < ApplicationController

  def index

    @users = User.all

  end

  def show

    @user = User.find(params[:id])

  end

  def update

    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    flash[:notice] = "退会処理を実行しました"
    redirect_to admin_users_path

  end


  private
    def user_params
      params.require(:user).permit(:name,:introduction,:email,:password,:password_confirmation,
      :profile_image,:is_deleted)
    end

end
