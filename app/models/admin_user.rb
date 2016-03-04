require 'bcrypt'

class AdminUser < ActiveRecord::Base
  has_many :posts

  has_secure_password

end