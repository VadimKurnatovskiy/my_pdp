module Articles
  class FilteredQuery < BaseQuery
    DEFAULT_ARTICLES_ON_PAGE = 10

    FILTER_OPTIONS = %i[author query].freeze

    def all
      FILTER_OPTIONS.reduce(relation) do |result, key|
        if params[key].blank?
          result
        else
          send "apply_#{key}", result
        end
      end
    end

    private

    def apply_author(relation)
      relation.where(user_id: params[:author])
    end

    def apply_query(relation)
      relation.ransack(params[:query])
    end
  end
end
