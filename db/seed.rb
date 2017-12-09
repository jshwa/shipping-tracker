alice = User.create(username:"alice" , password:"password" , email:"alice@user.com")
bob = User.create(username:"bob" , password:"guest" , email:"bob@bob.com")

comp = alice.packages.create(name:"computer", shipping_co:"UPS", delivery_date:20171225, status: "warehouse", tracking_no:120938004)
printer = bob.packages.create(name:"printer", shipping_co:"UPS", delivery_date:20171225, status: "warehouse", tracking_no:293847923)

blender = alice.packages.create(name:"blender", shipping_co:"FedEx", delivery_date:20171102, status: "delivered", tracking_no:2398479823)
ice = bob.packages.create(name:"ice cube try", shipping_co:"DHL", delivery_date:20171108, status: "delivered", tracking_no:245634563)

amazon = Sender.create(name: "Amazon")
ebay = Sender.create(name: "eBay")
cubes = Sender.create(name:"Cubes-R-Us")

comp.sender = amazon
printer.sender = ebay
blender.sender = amazon
ice.sender = cubes

comp.save
printer.save
blender.save
ice.save
