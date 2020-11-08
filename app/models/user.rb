class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :movies
  has_many :reviews, dependent: :destroy
  has_many :reviews, through: :movies
end
