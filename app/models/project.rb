class Project < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :category
  has_many :applications, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :city, presence: true

  mount_uploader :photo, PhotoUploader

  pg_search_scope :global_search,
    against: [ :title, :content ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
