class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_car_path(params[:car_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :car_id, :comment_body)
  end
end
