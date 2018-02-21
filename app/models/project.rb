class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :city, presence: true

  mount_uploader :photo, PhotoUploader
end
