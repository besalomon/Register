class DeleteColumnBirthDate < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :birthdate, :string
  end
end

