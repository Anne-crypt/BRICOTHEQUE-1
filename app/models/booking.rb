class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  STATUS = %w[pending confirmed cancelled]

  validates :tool_id, :user_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUS }
end
