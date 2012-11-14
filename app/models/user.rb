class User < ActiveRecord::Base
  attr_accessible :email, :link, :name, :password_digest, :url, :username, :password, :password_confirmation

  has_many :lists

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  def self.login(username, password)
  	find_by_username(username).try(:authenticate, password)
  end
end
