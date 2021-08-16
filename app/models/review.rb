class Review < ApplicationRecord
  RATING = [0..5].freeze
  belongs_to :booking

  validates :comment, lenght: {minimum: 6 }
  validates :rating, inclusion: { in: RATING }
end
