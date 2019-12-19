class UpdateArticle
  include Interactor

  delegate :params, :article, to: :context

  def call
    update_article!
  rescue ActiveRecord::ActiveRecordError => e
    context.fail!(message: e.message)
  end

  private

  def update_article!
    ActiveRecord::Base.transaction do

      article.update!(params)
    end
  end
end
