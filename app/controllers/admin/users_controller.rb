class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all

    @users = @users.page(params[:page]).per(10) # ページネーションを実装する
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
    params.require(:user).permit(:name, :introduction, :email, :password, :password_confirmation,
                                 :profile_image, :is_deleted)
  end
end
