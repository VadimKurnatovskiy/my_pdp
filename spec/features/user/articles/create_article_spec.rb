require "rails_helper"

feature "Create Article" do
  let(:user) { create :user }
  let(:article_attributes) { { title: "Title", text: "Text" } }

  background do
    login_as user
    visit new_users_article_path
  end

  scenario "User creates article" do
    fill_form(:article, article_attributes)
    click_button "Create"

    expect(page).to have_content("Article was successfully created.")
    expect(page).to have_content("Title")
    expect(page).to have_content("Text")
  end
end
