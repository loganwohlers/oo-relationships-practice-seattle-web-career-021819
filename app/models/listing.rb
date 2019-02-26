# create files for your ruby classes in this directory
class Listing
    @@all=[]
    attr_reader :city_name

    def initialize(city_name)
        @city_name=city_name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    #using a guest as a parameter- create a new Trip object
    def make_trip (guest)
        Trip.new(self, guest)
    end

    #helper method that iterates thru Trips.all and pulls out an array of all 
    #trips relavent to this instance that we can use in other methods
    def trips
        Trip.all.select { |trip| trip.listing==self}
    end

    def guests
        self.trips.map {|trip| trip.guest}
    end

    def trip_count
        self.trips.length
    end

    def self.find_all_by_city (city)
        Trip.all.select {|trip| trip.listing.city_name==city}
    end

    def self.most_popular
        count={}
        max=nil
        Trip.all.each do |trip|
            if (count[trip.listing]==nil)
                count[trip.listing]=1
            else
                count[trip.listing]+=1
            end

            if max==nil
                max=trip.listing
            elsif (count[trip.listing]>count[max])
                max=trip.listing
            end
        end
        max
    end
end

