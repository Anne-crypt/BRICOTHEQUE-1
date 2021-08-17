class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:tool).where(tools: { user: user })
    end
  end

  def confirm?
    true
  end
end
