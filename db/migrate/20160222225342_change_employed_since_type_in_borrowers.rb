class ChangeEmployedSinceTypeInBorrowers < ActiveRecord::Migration
   def self.up
  	change_column :borrowers, :employed_since, :string
  end
  
  def self.down
  	change_column :borrowers, :employed_since, :date
  end
end
