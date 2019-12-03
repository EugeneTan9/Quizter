class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :quizzes
  has_many :results
  has_many :badges_users
  has_many :badges, through: :badges_users
  has_one_attached :dp
end