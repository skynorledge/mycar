class User::CarsController < ApplicationController

  #before_action :authenticate_user!

  def new

    @car = Car.new

  end

  def edit

    @car = Car.find(params[:id])

  end

  def create

    @car = current_user

    @car = Car.new(car_params)

    @car.user_id = current_user.id

    @car.save

    redirect_to car_path(@car)

  end

  #def search
    #Viewのformで取得したパラメータをモデルに渡す
    #@cars = Car.search(params[:search])

  #end

  def update

    @car = Car.find(params[:id])
    @car.update(car_params)
    @car.save

    redirect_to car_path(@car.id)

  end

  def index

    if params[:maker_id] && params[:aero_maker_id] # 両方のIDが渡された場合
      @cars = Car.where(maker_id: params[:maker_id], aero_maker_id: params[:aero_maker_id])
    elsif params[:maker_id] # maker_idのみが渡された場合
      if params[:maker_id] == '8'
        @cars = Car.where.not(maker_id: [1, 2, 3, 4, 5, 6, 7])
      else
        @cars = Car.where(maker_id: params[:maker_id])
      end
    elsif params[:aero_maker_id] # aero_maker_idのみが渡された場合
      @cars = Car.where(aero_maker_id: params[:aero_maker_id])

    elsif params[:search]

      search_string = params[:search].tr('０-９ａ-ｚＡ-Ｚあ-んア-ケ', '0-9a-zA-Zぁ-んァ-ヶ').downcase
      #search_string = search_string.gsub('トヨタ', 'TOYOTA')
      #search_string = params[:search].gsub(/[ァ-ヶ]/, '.*').tr('０-９ａ-ｚＡ-Ｚあ-んア-ケ', '0-9a-zA-Zぁ-んァ-ヶ').downcase

      @cars = Car.joins(:maker,:aero_maker).where('LOWER(cars.title) LIKE ? OR LOWER(cars.body) LIKE ? OR LOWER(cars.car_model) LIKE ?
      OR LOWER(cars.maker_comment) LIKE ? OR LOWER(cars.aero_maker_comment) LIKE ?
      OR LOWER(makers.maker_name) LIKE ? OR LOWER(aero_makers.aero_maker_name) LIKE ? ',
      "%#{search_string}%", "%#{search_string}%", "%#{search_string}%","%#{search_string}%",
      "%#{search_string}%","%#{search_string}%","%#{search_string}%")

      #search_string = params[:search]
      #normalized_search_string = search_string.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z').downcase

      #@cars = Car.where('LOWER(title) LIKE ? OR LOWER(body) LIKE ? ', "%#{normalized_search_string}%", "%#{normalized_search_string}%")

    else
      #@cars = Car.all.page(params[:page])
      #@cars = Car.page(params[:page]).per(8)
      @cars = Car.all
    end

    @hit_count = @cars.count # 検索結果の件数を取得

    respond_to do |format|
      format.html # index.html.erbを表示
      format.json { render json: @cars }
    end


  end

  def show

    @car = Car.find(params[:id])
    @comment = Comment.new

  end

  def destroy

    car = Car.find(params[:id])
    car.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to cars_path

  end

  private

    def car_params
      params.require(:car).permit(:user_id,:maker_id,:aero_maker_id,:car_image,
      :profile_image,:title,:body,:maker_comment,:aero_maker_comment,:car_model,:created_at)
    end

end
