class AddCreatorToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :destinator, foreign_key: { to_table: :users }
    add_reference :reviews, :creator, foreign_key: { to_table: :users }
  end
end
