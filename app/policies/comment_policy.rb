class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    owner?
  end
end
