class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:tool).where(tools: { user: user })
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
