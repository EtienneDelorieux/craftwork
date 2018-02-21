class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :applications

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :city, presence: true
end
