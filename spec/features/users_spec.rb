require 'spec_helper'

feature "Users" do
  scenario "login" do
    user = login
    visit root_path
    expect(page).to have_content user.email
  end
end
