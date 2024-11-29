class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :toilet_categories
  has_many :categories, through: :toilet_categories

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
