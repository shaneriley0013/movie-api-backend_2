class User < ApplicationRecord
  has_many :movies		
  has_many :movies, through: :favorites		
end
