class MechanicsController < ApplicationController
  def index
   @mechanics = Mechanic.all
  end

  def show
   @mechanic = Mechanic.find(params[:id])
   @rides = @mechanic.alphabetize_rides
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.add_ride(Ride.find(params[:add_ride]))

    redirect_to "/mechanics/#{params[:id]}"
  end
end
