class Review < ActiveRecord::Base
  validates :email, :rating, :movie_id, presence: true
  belongs_to :movie

  def movie_title
    movie.title
  end
end
