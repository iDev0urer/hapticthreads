class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.references :category, index: true, foreign_key: true
      t.text :description
      t.string :size

      t.timestamps null: false
    end
  end
end
