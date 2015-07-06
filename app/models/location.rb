class Location < ActiveRecord::Base

  def within_range
    locations = Location.where.not(id: self.id)
    rgeo_factory = RGeo::Geographic.spherical_factory(:srid => 4326)
    locations.each do |location|
      # distance in meters
      rgeo_factory.point(self.lonlat.x, self.lonlat.y).distance(location.lonlat)

    end

  end
end
