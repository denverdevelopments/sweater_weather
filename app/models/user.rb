class User < ApplicationRecord
  # has_secure_password
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  validates :password_digest, presence: true
  # validates :password, confirmation: { case_sensitive: true }, on: :save
  validates :api_key, uniqueness: true, presence: true
  has_secure_password


  # def self.valid_api?(api_key)
  #     User.where(api_key: api_key).count > 0
  # end
end
