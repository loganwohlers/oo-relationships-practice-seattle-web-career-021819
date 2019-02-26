require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

seattle=Listing.new("Seattle")
la=Listing.new("Los Angeles")
logan=Guest.new("Logan")
ellen=Guest.new("Ellen")


ltrip=logan.make_trip(seattle)
ltrip2=logan.make_trip(la)
etrip=ellen.make_trip(seattle)
etrip2=la.make_trip(ellen)

p seattle
p la
puts
p logan
p ellen
puts
p ltrip
p ltrip2
p etrip
p etrip2
puts 
p Listing.find_all_by_city("Seattle")
p Guest.pro_traveller



Pry.start
