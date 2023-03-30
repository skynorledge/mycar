class User::LikesController < ApplicationController

  def create
    car = Car.find(params[:car_id])
    like = current_user.likes.new(car_id: car.id)
    like.save
    redirect_to car_path(car)
  end

  def destroy
    car = Car.find(params[:car_id])
    like = current_user.likes.find_by(car_id: car.id)
    like.destroy
    redirect_to car_path(car)
  end

  def like_params
    params.require(:like).permit(:user_id,:car_id)
  end


end
