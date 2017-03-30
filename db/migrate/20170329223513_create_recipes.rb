class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :difficulty
      t.integer :prep_time
      t.string :category
      t.text :instructions
      t.references :user

      t.timestamps
    end
  end
end
