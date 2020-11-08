class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, :description, :movie_length, :director, :rating, presence: true
end
 