class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def new
      true
    end

    def create
      true
    end

  end
end
