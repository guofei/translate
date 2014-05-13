require 'spec_helper'

feature "Articles" do
  scenario "create a article" do
    aritcle = build(:article)

    visit articles_path
    fill_in "URL", with: article.url
    fill_in "Title", with: article.title
    fill_in "Content", with: article.content
    click_button "Create"

    expect(page).to have_content article.content
  end
end
