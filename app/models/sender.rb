class Sender < ActiveRecord::Base
  has_many :packages
  has_many :users, through: :packages

end
