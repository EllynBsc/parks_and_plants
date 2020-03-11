class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
