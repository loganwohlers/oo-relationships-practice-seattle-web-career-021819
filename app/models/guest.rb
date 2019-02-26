# create files for your ruby classes in this directory
class Guest
    @@all=[]
    attr_reader :name

    def initialize(name)
        @name=name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def make_trip (listing)
        Trip.new(listing, self)
    end

    def trips
        Trip.all.select { |trip| trip.guest==self}
    end

    def listings
        self.trips.map {|trip| trip.listing}
    end

    def trip_count
        self.trips.length
    end

    def self.pro_traveller
        count={}
        Trip.all.each do |trip|
            if (count[trip.guest]==nil)
                count[trip.guest]=1
            else
                count[trip.guest]+=1
            end
        end

        pro=[]
        count.each do |k, v|
            if (v>1)
                pro.push(k)
            end
        end
        pro
    end


end
