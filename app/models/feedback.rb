class Feedback
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :email, :name, :message, :phone

  validates :email, :name, :message, presence: true
  validates :email, format: Devise.email_regexp

  def attributes
    {
      email: nil,
      name: nil,
      message: nil,
      phone: nil
    }
  end

  def save
    valid?
  end
end
