class MechanicsController < ApplicationController
  def index
   @mechanics = Mechanic.all
  end

  def show
   @mechanic = Mechanic.find(params[:id])
   @rides = @mechanic.rides
  end

  def edit
    @mechanic = Mechanic.find(params[:id])
  end
end
