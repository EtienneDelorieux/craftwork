class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :zip, presence: true
end
