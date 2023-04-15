class HomesController < ApplicationController
  def top
    # if params[:maker_id] && params[:maker_id] != "8"
    #   @cars = Car.where(maker_id: params[:maker_id])
    # elsif params[:maker_id] == "8"
    #   @cars = Car.where.not(maker_id: [1, 2, 3, 4, 5, 6, 7])
    # else
    #   @cars = Car.all
    # end

    @cars = Car.all

    # if maker = Maker.find_by(maker_name: "その他")
    #   @other_cars = maker.cars
    # end

    # # その他以外のメーカーの Car レコードを取得する
    # @cars = Car.where.not(maker: Maker.where(maker_name: ["TOYOTA", "NISSAN", "HONDA", "MAZDA", "SUBARU", "MITSUBISHI", "SUZUKI"]))

    # # 検索フォームが使用された場合、検索条件に合致する Car レコードを取得する
    # if params[:search]
    #   @cars = @cars.where('name LIKE ?', "%#{params[:search]}%")
    # end
  end
end
