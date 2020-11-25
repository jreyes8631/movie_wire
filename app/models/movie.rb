class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  validates :description, :movie_length, :director, :rating, presence: true
  validates :title, presence: true , uniqueness: true
  
  def self.most_recent
    order('created_at DESC')
  end

  #randondly select a movie onject to disply that on the page.

  def self.featured 
    where.not(title: nil).sample
  end
  
end
 

