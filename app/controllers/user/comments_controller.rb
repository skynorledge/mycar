class User::CommentsController < ApplicationController

  def create
    car = Car.find(params[:car_id])
    comment = current_user.comments.new(comment_params)
    comment.car_id = car.id
    comment.save
    redirect_to car_path(car)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:car_id,:comment_body)
  end


end
