class AddProjectToApplication < ActiveRecord::Migration[5.1]
  def change
    add_reference :applications, :project, foreign_key: true
  end
end
