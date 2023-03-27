class User::InfosController < ApplicationController

  #before_action :authenticate_customer!, except: [:show,:edit]

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

  def destroy

    car = Car.find(params[:id])
    car.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to cars_path

  end


  private
    def user_params
      params.require(:user).permit(:name,:introduction,:email,:encrypted_password,
      :profile_image)
    end

end
