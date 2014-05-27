require 'spec_helper'

describe User do
  let(:user) { create(:user, email: "xyz@abc.com") }

  # in rspec 3.0 use it like this: it { is_expected.not_to be_empty }
  # https://www.relishapp.com/rspec/rspec-core/v/3-0/docs/subject/one-liner-syntax
  it { should respond_to(:articles) }

  it "return user's name" do
    expect(user.name).to eq("xyz")
  end
end
