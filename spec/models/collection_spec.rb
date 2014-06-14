require 'spec_helper'

describe Collection do
  let(:collection) { build(:collection) }

  describe "when user is not present" do
    before { collection.user = nil }
    it "shoule not be valid" do
      expect(collection).not_to be_valid
    end
  end

  describe "when article is not present" do
    before { collection.article = nil }
    it "shoule not be valid" do
      expect(collection).not_to be_valid
    end
  end
end
