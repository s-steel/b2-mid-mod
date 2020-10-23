class ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @rides = Ride.where(park_id: @park.id)
  end
end
