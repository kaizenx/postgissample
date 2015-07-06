class LocationsController < ApplicationController

  def show
    @location = Location.find(params[:id])
    @nearby = @location.within_range
  end

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    # Creates and returns a geographic factory that does not include a a projection,
    # and which performs calculations assuming a spherical earth. In other words, geodesics
    # are treated as great circle arcs, and geometric calculations are handled accordingly.
    # Size and distance calculations report results in meters. This implementation is thus ideal
    # for everyday calculations on the globe in which good accuracy is desired,
    # but in which it is not deemed necessary to perform the complex ellipsoidal calculations needed for greater precision.
    factory = RGeo::Geographic.spherical_factory(:srid => 4326)
    # "101.123123 3.123123"
    point = factory.point(params[:location][:lonlat].split(" ")[0] , params[:location][:lonlat].split(" ")[1])
    @location.lonlat = point
    if @location.save
      redirect_to locations_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:lonlat)
  end
end
