class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :role_id
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :photo
      t.string :phone_number
      t.string :email_address
      t.string :birthdate

      t.timestamps
    end
  end
end
