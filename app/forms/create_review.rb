class CreateReview

  include ActiveModel::Model

  delegate :rating, :email, :comment, to: :review
  delegate :title, to: :movie
  validates_numericality_of :rating, greater_than: 0, only_integer: false
  validates_numericality_of :rating, less_than_or_equal_to: 5, only_integer: false

  validates :email, :comment, :rating, :title, presence: true

  def movie
    @movie ||= Movie.find_or_create_by(@movie_params)
  end

  def review
    @review ||= Review.new
  end

  def submit(params)
    review.attributes = params.slice(:rating, :email, :comment)
    @movie_params = params.slice(:title)
    review.movie = movie

    if valid?
      review.save
      true
    else
      false
    end
  end

end
