class User < ApplicationRecord
   has_secure_password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates_length_of :password, :in => 6..20, :on => :create

  has_many :questions
  has_many :answers
  has_many :comments
end
