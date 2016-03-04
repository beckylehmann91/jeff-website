require 'bcrypt'

class AdminUser < ActiveRecord::Base
  has_many :posts

  validates :password_digest, presence: true

  has_secure_password

end