class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates :tool_id, :user_id, :start_date, :end_date, presence: true
end
