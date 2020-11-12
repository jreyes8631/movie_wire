class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end


def show_by_order_desc
  Review.where(movie_id: @movie.id).order("create_at DESC")
end