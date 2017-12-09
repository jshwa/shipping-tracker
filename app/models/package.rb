class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender

end
