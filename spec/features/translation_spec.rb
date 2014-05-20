require 'spec_helper'

feature "Article translates" do
  scenario "translate a article" do
    article = create(:article)
    t = Translation.new(article_id: article.id, text: article.text)
    t.init_bare
    visit article_path(article)

    click_button "Create Translation"
  end
end
