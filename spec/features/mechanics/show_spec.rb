require 'rails_helper'

describe 'mechanic show page' do
  park = Park.create(name: 'Hershey Park', price: 50)
  ride1 = Ride.create(name: 'Lightning Racer', rating: 9, park_id: park.id)
  ride2 = Ride.create(name: 'Storm Runner', rating: 6, park_id: park.id)
  ride3 = Ride.create(name: 'The Great Bear', rating: 8, park_id: park.id)
  mechanic = Mechanic.create!(name: 'Sam Mills', experience: 10)
  mech_ride1 = MechanicRide.create(ride_id: ride1.id, mechanic_id: mechanic.id)
  mech_ride2 = MechanicRide.create(ride_id: ride2.id, mechanic_id: mechanic.id)
  mech_ride3 = MechanicRide.create(ride_id: ride3.id, mechanic_id: mechanic.id)

  before do
    visit "/mechanics/#{mechanic.id}"
  end

  it 'shows their infomation' do
    expect(page).to have_content("Mechanic: #{mechanic.name}")
    expect(page).to have_content("Years of Experience: #{mechanic.experience}")
  end

  it 'lists rides working on' do
    expect(page).to have_content("Current rides they're working on:")
    expect(page).to have_content(ride1.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride3.name)
  end

  it 'has form to add rides to workload' do
    expect(page).to have_content('Add a ride to their workload:')
    expect(page.has_field?(:add_ride, type: 'text')).to eq(true)
    expect(page).to have_button('Submit')
  end

  it 'can submit form, return to show page, and see the added ride' do
    ride4 = Ride.create(name: 'The Kiss Raise', rating: 3, park_id: park.id)

    fill_in :add_ride, with: ride4.id
    click_button 'Submit'
    expect(current_path).to eq("/mechanics/#{mechanic.id}")

    expect(page).to have_content(ride4.name)

    expect(page).to have_content('Add a ride to their workload:')
    expect(page.has_field?(:add_ride, type: 'text')).to eq(true)
    expect(page).to have_button('Submit')
  end

  it 'shows all rides in alphabetical order' do
save_and_open_page
  end
end
