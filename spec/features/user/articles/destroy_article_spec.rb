require "rails_helper"

feature "Destroy Article" do
  let(:user) { create :user }
  let!(:article1) { create :article, user: user, title: "First article title", text: "First article text" }
  let!(:article2) { create :article, title: "Second article title", text: "Second article text" }

  background do
    login_as user
  end

  scenario "User deletes article" do
    visit article_path(article1)

    click_on "Destroy"

    expect(page).to have_content "Article was successfully destroyed."
    expect(page).not_to have_content "First article title"
    expect(page).not_to have_content "First article text"
  end

  scenario "User deletes other user's article" do
    visit article_path(article2)

    expect(page).not_to have_link "Destroy"
  end
end
