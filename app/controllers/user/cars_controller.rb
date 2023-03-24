class User::CarsController < ApplicationController

  #before_action :authenticate_user!

  def new

    @car = Car.new

  end

  def edit

    @car = Car.find(params[:id])

  end

  def create

    @car = Car.new(car_params)

    @car.save

    redirect_to car_path(@car)

  end

  def update

    @car = Car.find(params[:id])
    @car.update(car_params)
    @car.save

    redirect_to car_path(@car.id)

  end

  def index

    @cars = Car.all

  end

  def show

    @car = Car.find(params[:id])
    @comment = Comment.new

  end

  private

    def car_params
      params.require(:car).permit(:user_id,:maker_id,:aero_maker_id,:car_image,
      :title,:body,:maker_comment,:aero_maker_comment,:car_model)
    end

end
