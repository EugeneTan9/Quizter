class Badge < ApplicationRecord
  belongs_to :quiz
  has_many :users, through: :badges_users
end