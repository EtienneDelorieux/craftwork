class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, foreign_key: "destinator_id", dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :applications, dependent: :destroy

  validates :lastname, presence: true
  validates :firstname, presence: true
end
