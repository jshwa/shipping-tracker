class User < ActiveRecord::Base
  has_many :packages
  has_many :senders, through: :packages

  has_secure_password

  validates_presence_of :username, :email

end
