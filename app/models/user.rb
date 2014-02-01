class User < ActiveRecord::Base
  include RatingAverage
  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships
  
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
end