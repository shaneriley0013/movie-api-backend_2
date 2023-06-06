class User < ApplicationRecord
  has_many :movies		
  has_many :movies, through: :favorites
  has_secure_password
  validates :email, presence: true, uniqueness: true


end
