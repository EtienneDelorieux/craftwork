class Category < ApplicationRecord
  include PgSearch
  has_many :projects
  has_many :reviews
end
