class User < ActiveRecord::Base
  include RatingAverage
  has_many :ratings   # käyttäjällä on monta ratingia
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
end
