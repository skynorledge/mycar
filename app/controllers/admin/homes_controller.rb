class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @cars = Car.all

    @cars = @cars.page(params[:page]).per(8) # ページネーションを実装する
  end
end
