class Beer < ActiveRecord::Base
  def average_rating
    ratings.average("score")
  end

  def to_s
    "#{name} (" + brewery.name + ")"
  end 
  belongs_to :brewery
  has_many :ratings
end

