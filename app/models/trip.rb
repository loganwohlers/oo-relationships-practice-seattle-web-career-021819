# create files for your ruby classes in this directory
class Trip
    @@all=[]
    attr_reader :listing, :guest

    def initialize(listing, guest)
        @listing=listing
        @guest=guest
        @@all.push(self)
    end

    def self.all
        @@all
    end

    


end
