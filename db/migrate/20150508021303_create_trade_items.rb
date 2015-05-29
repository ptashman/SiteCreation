class CreateTradeItems < ActiveRecord::Migration
  def change
    create_table :trade_items do |t|
      t.string :name
      t.timestamps
    end
  end
end
