class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender

  def tracking_url
    case self.shipping_co
    when "FEDEX"
      "https://www.fedex.com/apps/fedextrack/?action=track&tracknumbers=#{self.tracking_no}"
    when "DHL"
      "http://www.dhl.com/en/express/tracking.html?AWB=#{self.tracking_no}&brand=DHL"
    when "UPS"
      "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums;=#{self.tracking_no}"
    when "USPS"
      "https://tools.usps.com/go/TrackConfirmAction_input?qtc_tLabels1=#{self.tracking_no}"
    else
      "#"
    end
  end
end
