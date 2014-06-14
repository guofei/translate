require 'spec_helper'

feature "Users" do
  scenario "login" do
    user = login
    visit root_path
    expect(page).to have_content user.email
  end

  scenario "collected articles" do
    user = login
    visit user_path(user)
    expect(page).to have_content I18n.t('collections.collected')
  end
end
