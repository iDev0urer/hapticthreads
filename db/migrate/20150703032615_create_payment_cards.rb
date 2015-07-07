class CreatePaymentCards < ActiveRecord::Migration
  def change
    create_table :payment_cards do |t|
      t.integer :last4
      t.string :brand
      t.string :funding
      t.integer :exp_month
      t.integer :exp_year
      t.string :fingerprint
      t.string :country

      t.references :customer

      t.timestamps null: false
    end
  end
end
