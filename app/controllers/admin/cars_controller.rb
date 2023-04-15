class Admin::CarsController < ApplicationController

  def show

    @car = Car.find(params[:id])
    @comment = Comment.new

  end

  def destroy

    car = Car.find(params[:id])
    car.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_root_path

  end

end
