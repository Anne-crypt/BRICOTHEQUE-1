class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:tool).where(tools: {user: user}).or(scope.joins(:tool).where(user: user))
      # where(tools: { user: user} OR bookings.user:  user)
    end
  end

  def confirm?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
