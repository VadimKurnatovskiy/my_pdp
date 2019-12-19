class ArticleSerializer < BaseSerializer
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attributes :id, :title, :text, :average_rating, :ratings_count,
    :author_full_name, :short_text, :time_created_in_words

  def author_full_name
    user.full_name_with_email
  end

  def short_text
    truncate(object.text, length: 300)
  end

  def time_created_in_words
    time_ago_in_words(object.created_at)
  end

  private

  def user
    @user ||= object.user.decorate
  end
end
