require 'rails_helper'

describe 'mechanic index page' do
  before do
    visit '/mechanics'
  end

  it 'shows a header' do
    expect(page).to have_content('All Mechanics')
  end

  it 'lists all mechaincs names and years experience' do
    mech1 = Mechanic.create!(name: 'Sam Mills', experience: 10)
    mech2 = Mechanic.create!(name: 'Kara Smith', experience: 11)

    expect(page).to have_content(mech1.name)
    expect(page).to have_content("#{mech1.experience} years of experience")
    expect(page).to have_content(mech2.name)
    expect(page).to have_content("#{mech2.experience} years of experience")
  end
end
