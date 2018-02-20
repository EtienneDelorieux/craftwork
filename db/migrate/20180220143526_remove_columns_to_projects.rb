class RemoveColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :department
  end
end
