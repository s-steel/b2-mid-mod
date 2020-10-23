require 'rails_helper'

describe 'parks show page' do
  park = Park.create(name: 'Hershey Park', price: 50)
  ride1 = Ride.create(name: 'Lightning Racer', rating: 9, park_id: park.id)
  ride2 = Ride.create(name: 'Storm Runner', rating: 6, park_id: park.id)
  ride3 = Ride.create(name: 'The Great Bear', rating: 8, park_id: park.id)

  before do
    visit "/parks/#{park.id}"
  end

  it 'lists parks name and price' do
    expect(page).to have_content(park.name)
    expect(page).to have_content("Admissions: $#{park.price}")
  end

  it 'lists rides' do
    expect(page).to have_content('Rides:')
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride3.name)
    expect(page).to have_content("Average Thrill Rating of Rides: 7.7/10")
  end
end
