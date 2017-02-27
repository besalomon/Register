class AddBirthDate < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthdate, :datetime
  end
end
