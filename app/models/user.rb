class User < ApplicationRecord
  has_many :registrations, dependent: :delete_all
  has_many :events, through: :registrations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  scope :get_name, ->(id) { where(id: id).pluck(:name) }
end
