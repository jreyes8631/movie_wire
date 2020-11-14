class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  validates :title, :description, :movie_length, :director, :rating, presence: true
end
 

def self.show_order_desc
  self.reviews.where(movie_id: @movie.id).order("created_at DESC")
end