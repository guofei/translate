include Warden::Test::Helpers

module FeatureHelpers
  def login
    user = create(:user)
    login_as user, scope: :user
    user
  end

  def create_aritcle
    article = create(:article)
    t = Translation.new(article_id: article.id, text: article.text)
    t.init_bare
    article
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
