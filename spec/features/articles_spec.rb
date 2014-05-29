require 'spec_helper'

feature "Articles" do
  context "all visitors" do
    scenario "see article" do
      article = create_aritcle

      visit article_path(article)
      expect(page).to have_content article.text
    end
  end

  context "as a user" do
    scenario "create a article" do
      article = build(:article)
      login

      visit new_article_path
      fill_in "Title", with: article.title
      fill_in "Translated title", with: article.translated_title
      fill_in "Brief", with: article.brief
      fill_in "Text", with: article.text
      select article.source, from: "Source"
      select article.target, from: "Target"
      click_button "Create Article"

      expect(page).to have_content article.text
    end
  end
end
