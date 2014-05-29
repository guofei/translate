# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "abc"
    translated_title "abc"
    original_link "http://www.abc.com"
    brief "a good article"
    text "this is a good article.hello word nihao konitiwa"
    source "English"
    target "Chinese"
  end
end
