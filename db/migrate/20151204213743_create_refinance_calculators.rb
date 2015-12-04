class CreateRefinanceCalculators < ActiveRecord::Migration
  def change
    create_table :refinance_calculators do |t|
      t.decimal :loan_amt
      t.decimal :original_rate
      t.integer :original_term
      t.integer :payments
      t.decimal :new_rate
      t.integer :new_term

      t.timestamps null: false
    end
  end
end
