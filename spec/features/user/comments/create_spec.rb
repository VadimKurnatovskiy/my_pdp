require "rails_helper"

feature "Create Article" do
  let(:user) { create :user }
  let(:article) { create :article }
  let(:comment_attributes) { { text: "Comment text" } }

  background do
    login_as user
    visit article_path(article)
  end

  scenario "User creates comment" do
    fill_form(:comment, comment_attributes)
    click_button "Send"

    expect(page).to have_content("Comment text")
  end

  scenario "User creates comment without text" do
    fill_form(:comment, text: "")
    click_button "Send"

    expect(page).to have_content("can't be blank")
  end
end
