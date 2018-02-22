class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true #all users can see the projects
  end

  def create?
    true #all users can create projects
  end

  def update?
    #only owner can modify a project
   user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    @record.user == @user
  end

end
