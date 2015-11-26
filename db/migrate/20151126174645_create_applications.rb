class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :loan_purpose
      t.string :property_type
      t.decimal :purchase_price
      t.decimal :budget
      t.integer :borrower_id

      t.timestamps null: false
    end
  end
end
