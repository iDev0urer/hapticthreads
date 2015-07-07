class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.string :website

      t.timestamps null: false
    end
  end
end
