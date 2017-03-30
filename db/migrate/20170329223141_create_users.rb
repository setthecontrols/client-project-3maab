class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.text :email, null: false
      t.text :username, null: false
      t.text :password_digest, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
