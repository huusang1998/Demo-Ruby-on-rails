class User < ApplicationRecord
  has_secure_password
  validates :email, length: { minimum: 2}
end
