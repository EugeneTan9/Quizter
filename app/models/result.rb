class Result < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
  has_and_belongs_to_many :badges
end
