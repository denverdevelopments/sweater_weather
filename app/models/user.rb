class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }, on: :save
end
