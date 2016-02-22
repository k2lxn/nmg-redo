class ChangeMonthlyDebtTypeInBorrowers < ActiveRecord::Migration
  def self.up
  	change_column :borrowers, :monthly_debt, :string
  end
  
  def self.down
  	change_column :borrowers, :monthly_debt, :decimal
  end
end
