class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  validates :title, :description, :movie_length, :director, :rating, presence: true

 def self.show_order_desc
  order("created_at DESC")
 end 

end
 

