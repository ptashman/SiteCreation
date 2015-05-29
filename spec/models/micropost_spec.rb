require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @micropost = Micropost.new(wants_item: "Lorem", has_item: "Ipsum", user_id: user.id)
  end

  subject { @micropost }

  it { should respond_to(:wants_item) }
  it { should respond_to(:has_item) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before do
      @micropost.wants_item = " "
      @micropost.has_item = " "
    end
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before do
      @micropost.wants_item = "a" * 141
      @micropost.has_item = "a"
    end
    it { should_not be_valid }
  end
end
