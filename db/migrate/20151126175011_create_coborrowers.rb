class CreateCoborrowers < ActiveRecord::Migration
  def change
    create_table :coborrowers do |t|
      t.boolean :spouse
      t.string :first_name
      t.string :last_name
      t.integer :credit_score
      t.integer :borrower_id

      t.timestamps null: false
    end
  end
end
