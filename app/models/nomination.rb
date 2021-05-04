class Nomination < ApplicationRecord
  has_many :users, through: :titles
end
