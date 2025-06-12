class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments
  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :password_confirmation, presence: true, if: -> { new_record? || !password.nil? }
end
