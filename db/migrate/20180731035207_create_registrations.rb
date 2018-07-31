class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.references :order, foreign_key: true
      t.string :user_name
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
