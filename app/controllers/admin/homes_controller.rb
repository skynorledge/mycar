class Admin::HomesController < ApplicationController
  def top

    @cars = Car.all

    @cars = @cars.page(params[:page]).per(8) # ページネーションを実装する

  end
end
