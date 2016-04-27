require 'rails_helper'

RSpec.describe CreateReview do

  describe 'Creating a new review' do
    let(:comment){ "This movie was fun to watch"}
    context 'with valid attributes' do
      let(:review_attributes) do
        {
          title: "Fight Club",
          rating:       4.5,
          email:       "test@user.com",
          comment:     comment
        }
      end



      it 'will create a review' do
        review = CreateReview.new
        expect {
          review.submit(review_attributes)
        }.to change(Review, :count).by(1)
      end

      it 'will create a movie' do
        review = CreateReview.new
        expect {
          review.submit(review_attributes)
        }.to change(Movie, :count).by(1)
      end
    end

    context 'when movie exists' do
      let!(:movie){ Movie.create(title: "Rocky")}

      let(:review_attributes) do
        {
          title: movie.title,
          rating:       4.5,
          email:       "test@user.com",
          comment:     comment
        }
      end

      it 'will not create a new movie' do
        review = CreateReview.new
        expect {
          review.submit(review_attributes)
        }.to change(Movie, :count).by(0)
      end

      it 'will create a new review with an existing movie' do
        review = CreateReview.new
        expect {
          review.submit(review_attributes)
        }.to change(Review, :count).by(1)
      end
    end

    context 'with invalid review data' do
      let(:review_attributes) do
        {
            title:        "Rocky",
            rating:       "sdfsdfsd",
            email:       "test@user.com",
            comment:     comment
        }
      end

      it 'will not create a new movie' do
        review = CreateReview.new
        expect {
          review.submit(review_attributes)
        }.to change(Review, :count).by(0)
      end

      it 'will have errors' do
        review = CreateReview.new
        review.submit(review_attributes)
        expect(review.errors).to be
      end
    end
  end
end
