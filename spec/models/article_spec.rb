require 'spec_helper'

describe Article do
  let(:article) { FactoryGirl.build(:article) }

  describe "when title is not present" do
    before { article.title = " " }
    it { should_not be_valid }
  end

  describe "when text is not present" do
    before { article.text = " " }
    it { should_not be_valid }
  end

  describe "when brief is not present" do
    before { article.brief = " " }
    it { should_not be_valid }
  end
end
