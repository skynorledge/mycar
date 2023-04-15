class AeroMaker < ApplicationRecord
  has_many :cars, dependent: :destroy
end
