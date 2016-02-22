class ChangePurchasePriceTypeInApplications < ActiveRecord::Migration
  def self.up
  	change_column :applications, :purchase_price, :string
  end
  
  def self.down
  	change_column :applications, :purchase_price, :decimal
  end
end
