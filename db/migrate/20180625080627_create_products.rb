class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.text :description
      t.float :price
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
