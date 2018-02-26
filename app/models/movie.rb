class Movie < ApplicationRecord

  belongs_to :director
  has_many :characters
  has_many :actors, :through => :characters

  # has_many :actors, class_name: 'Actor', foreign_key: 'movie_id'
  # def actors
  #  ...
  # end

end
