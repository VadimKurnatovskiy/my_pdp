class SearchForm extends Components.Base
  refs:
    searchForm: "#search_form"
    articles: ".js-articles"

  bindings: ->
    @$refs.searchForm.on "input", $.debounce(@_showArticles, 300)

  _showArticles: (event) =>
    $.ajax
      url: "/articles"
      dataType: "json"
      data:
        query:
          article_cont: event.currentTarget.value
      success: (response) =>
        @$refs.articles.html(JST["templates/components/articles"]({ articles: response });)

$ ->
  new SearchForm($el) for $el in $(".js-articles-search-form")
