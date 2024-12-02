class Toilet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :toilet_categories
  has_many :categories, through: :toilet_categories

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  # Scopes für die Filter
  scope :female_friendly, -> { where(female_friendly: true) }
  scope :handicap_friendly, -> { where(handicap_friendly: true) }
  scope :family_friendly, -> { where(family_friendly: true) }
  scope :clean, -> { where(clean: true) }
  scope :dirty, -> { where(clean: false) }
  scope :accessible, -> { where(accessible: true) }

  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end
