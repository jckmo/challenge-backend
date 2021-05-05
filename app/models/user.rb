class User < ApplicationRecord
  has_secure_password
  has_many :nominations
  has_many :titles, through: :nominations
end
