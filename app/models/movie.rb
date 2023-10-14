class Movie < ApplicationRecord
  enum status: {draft:0, published: 2}

  belongs_to :director
  belongs_to :movie_genre
end
