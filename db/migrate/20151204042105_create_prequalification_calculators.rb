class CreatePrequalificationCalculators < ActiveRecord::Migration
  def change
    create_table :prequalification_calculators do |t|
      t.decimal :income
      t.decimal :debt
      t.decimal :rate
      t.integer :term
      t.decimal :down

      t.timestamps null: false
    end
  end
end
