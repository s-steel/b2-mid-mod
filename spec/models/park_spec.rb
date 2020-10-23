require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :rides}
  end

  describe 'instance methods' do
    park = Park.create(name: 'Hershey Park', price: 50)
    ride1 = Ride.create(name: 'Lightning Racer', rating: 9, park_id: park.id)
    ride2 = Ride.create(name: 'Storm Runner', rating: 6, park_id: park.id)
    ride3 = Ride.create(name: 'The Great Bear', rating: 8, park_id: park.id)

    it '#average_thrill' do
      expect(park.average_thrill.round(1)).to eq(7.7)
    end
  end
end
