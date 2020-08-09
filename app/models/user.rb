class User < ApplicationRecord
  has_many :tasks
  validates :userid, presence: true, length: { maximum: 10,minimum: 5 }
  has_secure_password

end
