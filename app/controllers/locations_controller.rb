class LocationsController < ApplicationController
    

  def index
    @trip = Trip.find(params[:trip_id])
    @locations = @trip.locations
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @location = Location.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip.locations.create(location_params)
    redirect_to trip_locations_path(@trip)
  end 

  def edit
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations.find(params[:id])
    @location.update(location_params)
    redirect_to trip_locations_path(@trip)
  end 

  def destroy
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations.find(params[:id])
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end 


  private 
    def location_params
      params.require(:location).permit(:name)
    end 
end
