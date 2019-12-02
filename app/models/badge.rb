class Badge < ApplicationRecord
  belongs_to :quiz
  has_many :users, through: :badges_users
  has_many :badges_users
  has_many :results
  has_one_attached :img_url
end