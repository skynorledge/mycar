class Car < ApplicationRecord

  has_one_attached :car_image
  has_one_attached :profile_image

  #acts_as_votable

  belongs_to :user
  belongs_to :maker
  belongs_to :aero_maker

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  # def self.search(search)
  #     return Car.all unless search
  #     Car.where(['content LIKE ?', "%#{search}%"])
  # end

  def get_car_image(width, height)
    unless car_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      car_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      car_image.variant(resize_to_limit: [width, height]).processed
  end

end
