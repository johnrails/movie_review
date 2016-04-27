class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def create
    @review = CreateReview.new
    @movie_title = review_params[:movie_title]
    if @review.submit(review_params)
      redirect_to reviews_path
    else
      render :new
    end
  end

  def new
    @review = CreateReview.new
    @movie_title = params[:title]
  end

  private
  
  def review_params
    params.require(:create_review).permit(:rating, :email, :comment, :movie_title)
  end
end
