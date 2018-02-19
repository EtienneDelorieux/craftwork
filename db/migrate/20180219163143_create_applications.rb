class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true
      t.float :quote
      t.integer :estimated_duration
      t.date :start_date
      t.text :comment
      t.boolean :selected

      t.timestamps
    end
  end
end
