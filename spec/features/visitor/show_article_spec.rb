require "rails_helper"

feature "Show Article" do
  let(:article) { create(:article).decorate }

  scenario "User see article" do
    visit article_path(article)

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.text)
    expect(page).to have_content(article.author_full_name)
    expect(page).to have_content(article.time_created_in_words)
  end
end
