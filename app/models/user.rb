class User < ApplicationRecord

  # attr_accessor :password

  has_secure_password

  validates :email, presence: true
  validates :password, presence: true

end
