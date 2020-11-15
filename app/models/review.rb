class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie


 def self.most_recent
    order('created_at DESC')
  end
  
end