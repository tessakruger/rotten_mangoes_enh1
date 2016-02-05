class User < ActiveRecord::Base

	paginates_per 20

	has_many :reviews

	has_secure_password

	validates :email,
  presence: true

  validates :firstname,
  presence: true

  validates :lastname,
  presence: true

	validates :password,
	length: { in: 6..20 }, on: :create

	def full_name
	  "#{firstname} #{lastname}"
	end

end
