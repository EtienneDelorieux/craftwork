class Review < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  belongs_to :destinator, foreign_key: "destinator_id", class_name: "User"
end
