require 'spec_helper'

feature "Article translates" do
  scenario "translate a article" do
    article = create_aritcle
    visit article_path(article)

    click_button I18n.t('translations.submit')
    expect(page).to have_content article.text
  end
end
