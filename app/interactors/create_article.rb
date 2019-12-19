class SaveArticle
  include Interactor

  delegate :params, :author, :article, to: :context

  before do
    context.article = Article.new(article_attributes)
  end

  def call
    save_article!
  rescue ActiveRecord::ActiveRecordError => e
    context.fail!(message: e.message)
  end

  private

  def save_article!
    ActiveRecord::Base.transaction do

      article.save!
    end
  end

  def article_attributes
    params.merge(user: author)
  end
end
