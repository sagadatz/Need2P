class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :toilet_categories
  has_many :categories, through: :toilet_categories

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end
