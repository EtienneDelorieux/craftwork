class ChangeColumnToApplications < ActiveRecord::Migration[5.1]
  def change
    change_column :applications, :estimated_duration, :string
  end
end
