class CommentPolicy < ApplicationPolicy
  def create?
    owner?
  end

  def destroy?
    owner?
  end
end
