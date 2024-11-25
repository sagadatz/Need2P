class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :toilet_categories
  has_many :categories, through: :toilet_categories
end
