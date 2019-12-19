module Users
  class ArticlesController < Users::BaseController
    before_action :authorize_resource!, only: %i[edit update]

    expose(:article)

    def new
    end

    def create
      self.article =
      CreateArticle.call(params: article_params, author: current_user).article

      respond_with(article)
    end

    def edit
    end

    def update
      self.article =
      UpdateArticle.call(article: article, params: article_params).article

      respond_with(article)
    end

    def destroy
      article.destroy
      respond_with article
    end

    private

    def authorize_resource!
      authorize(article)
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
end
