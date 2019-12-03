class Badge < ApplicationRecord
  belongs_to :quiz
  has_many :badges_users
  has_many :users, through: :badges_users
  has_and_belongs_to_many :users
  has_one_attached :img_url
end