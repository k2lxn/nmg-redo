class CreateMortgageCalculators < ActiveRecord::Migration
  def change
    create_table :mortgage_calculators do |t|
      t.decimal :loan_amt
      t.decimal :rate
      t.decimal :term

      t.timestamps null: false
    end
  end
end
