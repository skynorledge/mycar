class User::InfosController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def confirm
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def liked_cars
    @user = current_user
    @liked_cars = @user.liked_cars
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save

      flash[:notice] = "会員情報を更新しました"

      redirect_to mypage_path

    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :password, :password_confirmation,
                                 :profile_image)
  end
end
