class ChangeIncomeTypeInBorrowers < ActiveRecord::Migration
  def self.up
  	change_column :borrowers, :income, :string
  end
  
  def self.down
  	change_column :borrowers, :income, :decimal
  end
end
