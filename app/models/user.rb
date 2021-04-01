class User < ApplicationRecord
  has_many :registrations, dependent: :delete_all
  has_many :events, through: :registrations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
