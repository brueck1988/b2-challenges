require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    @kara = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @alex = Mechanic.create!(name: 'Alex Potter', years_of_experience: 17)
    @brian = Mechanic.create!(name: 'Brian Simpson', years_of_experience: 2)

    @the_hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @spider_man = Ride.create!(name: 'Spider Man', thrill_rating: 9, open: true)
    @twin_dragons = Ride.create!(name: 'Twin Dragons', thrill_rating: 10, open: true)

    @Ride_Mechanic_1 = RideMechanic.create!(ride: @the_hurler, mechanic: @kara)
    @Ride_Mechanic_2 = RideMechanic.create!(ride: @twin_dragons, mechanic: @kara)
    @Ride_Mechanic_3 = RideMechanic.create!(ride: @the_hurler, mechanic: @alex)
    @Ride_Mechanic_4 = RideMechanic.create!(ride: @the_hurler, mechanic: @brian)
    @Ride_Mechanic_5 = RideMechanic.create!(ride: @spider_man, mechanic: @brian )
    @Ride_Mechanic_5 = RideMechanic.create!(ride: @twin_dragons, mechanic: @brian)
  end

  it 'shows all mechanics name and their years of experience' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_of_experience)
    expect(page).to have_content(@alex.name)
    expect(page).to have_content(@alex.years_of_experience)
    expect(page).to have_content(@brian.name)
    expect(page).to have_content(@brian.years_of_experience)
    # expect(page).to have_content(mechanics.average_years_of_experience)
  end
end
