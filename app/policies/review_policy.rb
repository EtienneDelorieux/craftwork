class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    ap "je suis dans new?"
    true
  end

  def create?
    true
  end

end
