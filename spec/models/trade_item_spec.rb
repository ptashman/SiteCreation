require 'spec_helper'

describe TradeItem do
  before { @trade_item = TradeItem.new(site_id: 1, name: "MyTradeItem") }

  subject { @trade_item }

  it { should respond_to(:name) }
  it { should respond_to(:site_id) }

  describe "when site_id is not present" do
    before { @trade_item.site_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before do
      @trade_item.name = " "
    end
    it { should_not be_valid }
  end
end
