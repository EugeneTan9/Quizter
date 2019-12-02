class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :badges
  has_many :badges_user
  has_many :results
end