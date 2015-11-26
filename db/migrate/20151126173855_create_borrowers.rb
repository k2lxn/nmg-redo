class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :credit_score
      t.string :email
      t.string :phone
      t.decimal :income
      t.decimal :monthly_debt
      t.string :employer
      t.date :employed_since

      t.timestamps null: false
    end
  end
end
