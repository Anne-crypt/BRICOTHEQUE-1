class Tool < ApplicationRecord
  attr_accessor :custom_field
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ["garden", "machinery", "home", "mechanic"]

  validates :name, :price_day, :price_deposit, :user_id, presence: true
  validates :category, inclusion: { in: CATEGORIES }, allow_nil: true

  include PgSearch::Model
  pg_search_scope :search_global,
                 against: %I[name description],
                 using: { tsearch: { prefix: true } }
end
