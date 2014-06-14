# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
    after(:build) do |collection|
      collection.user = create(:user)
      collection.article = create(:article)
    end
  end
end
