require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'instance methods' do
    park = Park.create(name: 'Hershey Park', price: 50)
    ride1 = Ride.create(name: 'Lightning Racer', rating: 9, park_id: park.id)
    ride2 = Ride.create(name: 'Storm Runner', rating: 6, park_id: park.id)
    ride3 = Ride.create(name: 'The Great Bear', rating: 8, park_id: park.id)
    mechanic = Mechanic.create!(name: 'Sam Mills', experience: 10)
    mech_ride1 = MechanicRide.create(ride_id: ride1.id, mechanic_id: mechanic.id)
    mech_ride2 = MechanicRide.create(ride_id: ride2.id, mechanic_id: mechanic.id)
    mech_ride3 = MechanicRide.create(ride_id: ride3.id, mechanic_id: mechanic.id)

    it '#add_ride' do
      expect(mechanic.rides).to eq([ride1, ride2, ride3])

      ride4 = Ride.create(name: 'The Kiss Raise', rating: 3, park_id: park.id)
      mechanic.add_ride(ride4)

      expect(mechanic.rides).to eq([ride1, ride2, ride3, ride4])
    end

    it '#alphabetize_rides' do
      expect(mechanic.alphabetize_rides).to eq([ride1, ride2, ride3])
    end
  end
end
