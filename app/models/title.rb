class Title < ApplicationRecord
  has_many :nominations
  has_many :users, through: :nominations
end
