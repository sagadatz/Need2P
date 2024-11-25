class Category < ApplicationRecord
  has_many :toilet_categories
  has_many :toilets, through: :toilet_categories
end
