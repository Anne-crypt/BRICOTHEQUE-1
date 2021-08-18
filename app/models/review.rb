class Review < ApplicationRecord
  belongs_to :booking
  RATING = [0, 1, 2, 3, 4, 5].freeze

  validates :comment, length: {minimum: 6 }
  validates :rating, inclusion: { in: RATING }
end
