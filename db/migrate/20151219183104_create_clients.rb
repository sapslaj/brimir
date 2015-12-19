class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.text :notes

      t.timestamps null: false
    end
  end
end
