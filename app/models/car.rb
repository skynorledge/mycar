class Car < ApplicationRecord

  has_one_attached :car_image

  belongs_to :user
  belongs_to :maker
  belongs_to :aero_maker

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end
