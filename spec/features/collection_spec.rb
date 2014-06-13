require 'spec_helper'

feature "Collections" do
  context "as a user" do
    scenario "collect one article" do
      article = create_aritcle
      user = login

      visit article_path(article)
      click_link I18n.t('collections.collect')

      pending "TODO!!!!!!!!"
    end
  end
end
