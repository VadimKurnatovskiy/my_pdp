module Users
  class CommentsController < Users::BaseController
    expose(:article)
    expose_decorated(:comments) { Comment.by_article(article) }
    expose(:comment, parent: :article)

    def create
      result = CommentArticle.call(article: article, author: current_user, comment: comment)

      self.comment = new_comment if result.success?

      render "articles/fragments"
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end

    def new_comment
      article.comments.build
    end
  end
end
