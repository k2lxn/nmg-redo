class AddZipCodeToApplication < ActiveRecord::Migration
  def change
  	add_column :applications, :zip_code, :string
  end
end
