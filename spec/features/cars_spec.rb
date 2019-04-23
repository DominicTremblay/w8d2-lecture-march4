require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Cars", type: :feature, js: true do

  before :each do
    @car1 = Car.create!({
      make: Make.new(make: 'Lincoln'),
      model: Model.new(model: 'M3'),
      trim: Trim.new(trim_level: 'XLE'),
      style: Style.new(body_style: 'Extended Cab Pickup'),
      year: 1971,
      colour: 'Red'
    })

    @car2 = Car.create!({
      make: Make.new(make: 'Buick'),
      model: Model.new(model: 'Mustang'),
      trim: Trim.new(trim_level: 'XLE'),
      style: Style.new(body_style: 'Passenger Van'),
      year: 2002,
      colour: 'Mint green'
    })

    @car3 = Car.create!({
      make: Make.new(make: 'Tesla'),
      model: Model.new(model: 'T'),
      trim: Trim.new(trim_level: 'XLE'),
      style: Style.new(body_style: 'Sedan coupe'),
      year: 2019,
      colour: 'Olive'
    })

  end
  
  scenario 'List all the cars' do

    visit '/cars'

    expect(page).to have_text('Lincoln M3 Extended Cab Pickup XLE 1971', count: 1)
    expect(page).to have_text('Buick Mustang Passenger Van XLE 2002', count: 1)
    expect(page).to have_text('Tesla T Sedan coupe XLE 2019', count: 1)
    save_screenshot('all_cars.png')
  end

  scenario 'Filter cars by make' do
    
    visit '/cars'

    fill_in 'Make', with: 'Tesla' 
    click_button 'Search!'

    expect(page).to have_text('Tesla T Sedan coupe XLE 2019', count: 1)
    expect(page).to_not have_text('Lincoln M3 Extended Cab Pickup XLE 1971')
    save_screenshot('filter_make.png')
  end

end
