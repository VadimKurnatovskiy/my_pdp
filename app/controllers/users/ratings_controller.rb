module Users
  class RatingsController < Users::BaseController
    respond_to :json

    expose(:article)
    expose(:rating) { article.ratings.find_or_initialize_by(user: current_user) }

    def create
      rating.update(rating_params)
      article.update(average_rating: article.ratings.average(:score).round(1))
      respond_with article, serializer: ::ArticleSerializer
    end

    private

    def rating_params
      params.require(:rating).permit(:score)
    end
  end
end
