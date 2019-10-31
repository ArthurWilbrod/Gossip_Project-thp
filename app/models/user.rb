class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :tags, through: :gossips
	has_many :private_messages
  has_many :join_pm_recipients
	has_many :likes
	has_many :gossips, through: :like
	has_secure_password

	validates :password, presence: true
	validates :email, presence: true, uniqueness: true

end
