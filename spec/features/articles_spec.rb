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
      fill_in "article_title", with: article.title
      fill_in "article_translated_title", with: article.translated_title
      fill_in "article_brief", with: article.brief
      fill_in "article_text", with: article.text
      select article.source, from: "article_source"
      select article.target, from: "article_target"
      page.find(".submit").click

      expect(page).to have_content article.text
    end
  end
end
