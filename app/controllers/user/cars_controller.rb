class User::CarsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    if params[:maker_id] && params[:aero_maker_id] # 両方のIDが渡された場合
      @cars = Car.where(maker_id: params[:maker_id], aero_maker_id: params[:aero_maker_id])
    elsif params[:maker_id] # maker_idのみが渡された場合
      @cars = if params[:maker_id] == '8'
                Car.where.not(maker_id: [1, 2, 3, 4, 5, 6, 7])
              else
                Car.where(maker_id: params[:maker_id])
              end
    elsif params[:aero_maker_id] # aero_maker_idのみが渡された場合
      @cars = Car.where(aero_maker_id: params[:aero_maker_id])

    elsif params[:search]

      search_string = params[:search].gsub('０-９ａ-ｚＡ-Ｚあ-んア-ケ', '0-9a-zA-Zぁ-んァ-ヶ').downcase

      @cars = Car.joins(:maker, :aero_maker).where('LOWER(cars.title) LIKE ? OR LOWER(cars.body) LIKE ? OR LOWER(cars.car_model) LIKE ?
      OR LOWER(cars.maker_comment) LIKE ? OR LOWER(cars.aero_maker_comment) LIKE ?
      OR LOWER(makers.maker_name) LIKE ? OR LOWER(aero_makers.aero_maker_name) LIKE ? ',
                                                   "%#{search_string}%", "%#{search_string}%", "%#{search_string}%", "%#{search_string}%",
                                                   "%#{search_string}%", "%#{search_string}%", "%#{search_string}%")

    elsif params[:tag_ids]

      @cars = Car.joins(:tags).where(tags: { id: params[:tag_ids] }).distinct

    else

      @cars = Car.all

    end

    @hit_count = @cars.count # 検索結果の件数を取得

    @cars = @cars.page(params[:page]).per(8) # ページネーションを実装する

    respond_to do |format|
      format.html # index.html.erbを表示
      format.json { render json: @cars }
    end
  end

  def show
    @car = Car.find(params[:id])
    @comment = Comment.new
    @comments = @car.comments.page(params[:page]).per(5) # ページネーションを実装する
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = current_user.cars.build(car_params)

    tag_ids = params[:tag_ids].keys if params[:tag_ids]

    if @car.save

      @car.save_tags(tag_ids)
      redirect_to car_path(@car)

    else
      render :new
    end
  end

  def update
    @car = current_user.cars.find(params[:id])
    tag_ids = params[:tag_ids].keys if params[:tag_ids]

    if @car.update(car_params)
      @car.save_tags(tag_ids)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def mypost
    @user = current_user
    @cars = @user.cars
    @cars = @cars.page(params[:page]).per(8) # ページネーションを実装する
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:maker_id, :aero_maker_id, :car_image, :profile_image, :title, :body,
                                :maker_comment, :aero_maker_comment, :car_model).merge(user_id: current_user.id)
  end
end
