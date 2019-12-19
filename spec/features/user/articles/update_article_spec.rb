require "rails_helper"

feature "Update  Article" do
  let(:user) { create :user }
  let(:article_attributes) { { title: "New title", text: "New text" } }
  let(:article1) { create :article, user: user, title: "Title", text: "Text" }
  let(:article2) { create :article, title: "Title", text: "Text" }

  background do
    login_as user
  end

  scenario "User updates article" do
    visit edit_users_article_path(article1)

    fill_form(:article, article_attributes)
    click_button "Update"

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_content("New title")
    expect(page).to have_content("New text")
  end

  scenario "User updates other user's article" do
    visit edit_users_article_path(article2)

    expect(page).not_to have_button "Update Article"
  end
end
