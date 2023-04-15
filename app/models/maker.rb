class Maker < ApplicationRecord
  has_many :cars, dependent: :destroy
end
