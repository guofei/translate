require 'spec_helper'

feature "Articles" do
  scenario "create a article" do
    article = build(:article)

    visit new_article_path
    fill_in "Title", with: article.title
    fill_in "Brief", with: article.brief
    fill_in "Text", with: article.text
    click_button "Create Article"

    expect(page).to have_content article.content
  end
end
