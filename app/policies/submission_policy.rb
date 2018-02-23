class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.project.user != @user #all users can create projects
  end

  def select?
    ap "je suis dans selct"
    ap user_is_owner?
    user_is_owner?
  end

  def user_is_owner?
    @record.project.user == @user
  end

end
