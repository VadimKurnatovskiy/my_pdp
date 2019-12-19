class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end

  def owner?
    user.present? && record.user == user
  end
end
