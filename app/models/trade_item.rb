class TradeItem < ActiveRecord::Base
  belongs_to :site
  validates :name, :site_id, presence: true
end
