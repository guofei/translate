require 'spec_helper'

describe Article do
  let(:article) { FactoryGirl.build(:article) }

  # in rspec 3.0 use it like this: it { is_expected.not_to be_empty }
  # https://www.relishapp.com/rspec/rspec-core/v/3-0/docs/subject/one-liner-syntax
  it { should respond_to(:user) }

  describe "when title is not present" do
    before { article.title = " " }
    it { should_not be_valid }
  end

  describe "when translated title is not present" do
    before { article.translated_title = " " }
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

  describe "when source is not present" do
    before { article.source = " " }
    it { should_not be_valid }
  end

  describe "when target is not present" do
    before { article.target = " " }
    it { should_not be_valid }
  end
end
