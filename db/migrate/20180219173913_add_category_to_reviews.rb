class AddCategoryToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :category, foreign_key: true
  end
end
