class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_one,   null: false
      t.string :street_two
      t.string :apartment
      t.string :city,       null: false
      t.string :state,      null: false
      t.integer :zip,       null: false
      t.boolean :primary,   null: false, default: true

      t.references :customer

      t.timestamps null: false
    end
  end
end
