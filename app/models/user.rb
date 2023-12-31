require "bcrypt"

class User < ApplicationRecord 
  include BCrypt 

  validates_presence_of :name 
  validates_presence_of :password, on: :create  
  validates :email, uniqueness: true, presence: true 

  has_secure_password 

  has_many :users_favorite, dependent: :destroy 
  has_many :favorites, through: :users_favorite

  def self.users_favorites 
    require 'pry'; binding.pry
  end
end