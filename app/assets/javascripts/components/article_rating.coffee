class ArticleRating extends Components.Base
  refs:
    starRatingItem: ".js-star-rating-item"
    articleRating: ".article-rating"

  config:
    ratingUrl: "/users/articles/:article_id/ratings"
    overallRatingText: "#ratings_count votes recorded (#average_rating rating)"

  initialize: ->
    @articleId = @$el.data("id")
    @currentUserRating = @props.data
    @_showCurrentUserRating()

  bindings: ->
    @$refs.starRatingItem.click @_updateArticleRating
    @$refs.starRatingItem.hover @_animateRating
    @$refs.starRatingItem.mouseout @_showCurrentUserRating

  _showCurrentUserRating: =>
    @$refs.starRatingItem.removeClass("fa-star").addClass("fa-star-o")
    @$refs.starRatingItem.slice(0, @currentUserRating).removeClass("fa-star-o").addClass("fa-star")

  _updateArticleRating: (event) =>
    event.preventDefault()
    rating = event.currentTarget.dataset.rating
    $.ajax
      url: @config.ratingUrl.replace(":article_id", @articleId)
      type: "POST"
      dataType: "json"
      data:
        rating:
          score: rating
      success: (response) =>
        @currentUserRating = rating
        @_updateRatingText(response)
        @_updateStars(rating)

  _updateRatingText: (response)=>
    text = @config.overallRatingText
      .replace("#ratings_count", response.ratings_count)
      .replace("#average_rating", response.average_rating)
    @$refs.articleRating.text(text)

  _updateStars: (rating) =>
    @$refs.starRatingItem.removeClass("fa-star").addClass("fa-star-o")
    @$refs.starRatingItem.slice(0, rating).removeClass("fa-star-o").addClass("fa-star")

  _animateRating: (event) =>
    rating = event.currentTarget.dataset.rating
    @_updateStars(rating)

$ ->
  new ArticleRating($el, {
    data : App.currentUserRating
  }) for $el in $(".js-article-rating")
