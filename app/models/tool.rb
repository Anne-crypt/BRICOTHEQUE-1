class Tool < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  CATEGORIES = ["garden", "machinery", "home", "mechanic"]

  validates :name, :price_day, :price_deposit, :user_id, presence: true
  validates :category, inclusion: { in: CATEGORIES }, allow_nil: true
end
