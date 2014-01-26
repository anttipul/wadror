class Beer < ActiveRecord::Base
  include RatingAverage

  def to_s
    "#{name} (" + brewery.name + ")"
  end 
  belongs_to :brewery
  has_many :ratings, :dependent => :destroy
end

