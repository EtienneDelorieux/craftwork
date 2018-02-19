class AddNameToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :name, :string
  end
end
