require 'spec_helper'

feature "Article translates" do
  scenario "translate a article" do
    article = create_aritcle
    visit article_path(article)

    click_button "Create Translation"
    expect(page).to have_content article.text
  end
end
