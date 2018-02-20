class RemoveColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_columns :users, :city, :siret, :address, :zip
  end
end
