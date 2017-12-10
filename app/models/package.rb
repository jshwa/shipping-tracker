class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender

  def tracking_url
    case self.shipping_co
    when "Fedex"
      "https://www.fedex.com/apps/fedextrack/?action=track&tracknumbers=#{self.tracking_no}&action=track"
    else
      "#"
    end
  end
end
