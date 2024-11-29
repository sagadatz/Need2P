class Review < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  validates :clean, presence: true, inclusion: { in: 0..5 }
  validates :dirty, presence: true, inclusion: { in: 0..5 }
  validates :accessible, presence: true, inclusion: { in: 0..5 }
  validates :paid_entry, presence: true, inclusion: { in: 0..5 }
  validates :female_friendly, presence: true, inclusion: { in: 0..5 }
  validates :well_located, presence: true, inclusion: { in: 0..5 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
