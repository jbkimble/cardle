class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :first_name, presence: true
  validates :last_initial, presence: true

end
