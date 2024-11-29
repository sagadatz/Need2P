class Review < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  # validates :clean,
  # validates :dirty, inclusion: { in: 0..5 }
  # validates :accessible, inclusion: { in: 0..5 }
  # validates :paid_entry, inclusion: { in: 0..5 }
  # validates :female_friendly, inclusion: { in: 0..5 }
  # validates :well_located, inclusion: { in: 0..5 }
  # validates :rating, inclusion: { in: 0..5 }
end
