require 'spec_helper'

describe Translation do
  let(:article) { create(:article) }
  let(:t) { Translation.new(article_id: article.id, text: article.text) }
  let(:text) { "yet another text" }

  before :each do t.init_bare end
  it "init bare git" do
    expect(t.versions.size).to eq 1
  end

  it "get latest data" do
    expect(t.text).to eq article.text
  end

  it "get all versions" do
    t.text = text
    t.update_page

    expect(t.versions.size).to eq 2
  end

  it "update page" do
    t.text = text
    t.update_page

    expect(t.text).to eq text
  end
end
