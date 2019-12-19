require "rails_helper"

feature "List articles" do
  let!(:first_article) { create :article, title: "First article title", text: "First article text" }
  let(:first_article_selector) { ".article-item[data-id='#{first_article.id}']" }
  let!(:second_article) { create :article, title: "Second article title", text: "Second article text" }
  let(:second_article_selector) { ".article-item[data-id='#{second_article.id}']" }

  background do
    visit articles_path
  end

  scenario "Visitor lists articles" do
    expect_to_have_first_article_data
    expect_to_have_second_article_data
  end

  def expect_to_have_first_article_data
    within first_article_selector do
      expect(page).to have_content("First article title")
      expect(page).to have_content("First article text")
    end
  end

  def expect_to_have_second_article_data
    within second_article_selector do
      expect(page).to have_content("Second article title")
      expect(page).to have_content("Second article text")
    end
  end
end
