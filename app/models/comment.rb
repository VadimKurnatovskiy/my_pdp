class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :text, presence: true

  scope :by_article, ->(article) { where(article: article) }
end
