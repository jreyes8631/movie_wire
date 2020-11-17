class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :comment, :rating, presence: true

  def self.most_recent
    order('created_at DESC')
  end
  
end