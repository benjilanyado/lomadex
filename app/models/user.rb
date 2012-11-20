class User < ActiveRecord::Base
  attr_accessible :email, :link, :name, :password_digest, :url, :username, :password, :password_confirmation, :avatar

  has_many :lists

  has_secure_password

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "50x50#" }

  before_validation :no_password_omniauth

  after_create :send_out_sign_up_email

  validates :email, presence: true, uniqueness: true, format: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :create, unless: :has_facebook_uid
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  def self.login(username, password)
  	find_by_username(username).try(:authenticate, password)
  end

  def no_password_omniauth
    self.password_digest = 0 if has_facebook_uid
  end

  def has_facebook_uid
    facebook_uid?
  end

  def send_out_sign_up_email
    UserMailer.sign_up_email(self).deliver
  end
end
