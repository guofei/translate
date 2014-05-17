require 'spec_helper'

feature "Article translates" do
  scenario "translate a article" do
    article = create(:article)
    visit article_path(article)

    click_button "Translate"
  end
end
