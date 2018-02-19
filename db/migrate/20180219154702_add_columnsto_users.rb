class AddColumnstoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :siret, :string
    add_column :users, :resume, :text
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :zip, :string
  end
end



