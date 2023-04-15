class Admin::HomesController < ApplicationController
  def top

    @cars = Car.all

  end
end
