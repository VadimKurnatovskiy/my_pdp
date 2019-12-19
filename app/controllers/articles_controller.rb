class ArticlesController < ApplicationController
  expose_decorated :articles, -> { paginate_articles }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  helper_method :current_user_rating

  respond_to :html, :json

  def index
    respond_with articles
  end

  def show
  end

  private

  def paginate_articles
    fetch_articles.page(params[:page].per(10))
  end

  def fetch_articles
    Articles::FilteredQuery.new(ordered_articles, params).all
  end

  def ordered_articles
    Article.includes(:user).order(created_at: :desc)
  end

  def current_user_rating
    @rating ||= article.ratings.find_by(user: current_user)
    @rating ? @rating.score : 0
  end
end
