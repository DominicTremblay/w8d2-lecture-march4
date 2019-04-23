require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Cars", type: :feature, js:true do


  before :each do

    @car1 = Car.create({
      make: Make.new(make: 'Lincoln'),
      model: Model.new(model: 'M3'),
      style: Style.new(body_style: 'Extended Cab Pickup'),
      trim: Trim.new(trim_level: 'XLE'),
      year: 1971,
      colour: 'Red'
    })

    @car2 = Car.create({
      make: Make.new(make: 'Buick'),
      model: Model.new(model: 'Mustang'),
      style: Style.new(body_style: 'Passenger Van'),
      trim: Trim.new(trim_level: 'XLE'),
      year: 2001,
      colour: 'Indigo'
    })

    @car3 = Car.create({
      make: Make.new(make: 'Ford'),
      model: Model.new(model: 'Escape'),
      style: Style.new(body_style: 'Two Door Coupe'),
      trim: Trim.new(trim_level: 'SAW'),
      year: 2019,
      colour: 'Midnight Blue'
    })


  end


  # scenario 'Display the list of cars' do
  
  #   visit '/cars'

  #   expect(page).to have_css('.car', count: 3)
  #   expect(page).to have_text('Lincoln M3 Extended Cab Pickup XLE 1971')
  #   expect(page).to have_text('Buick Mustang Passenger Van XLE 2001')
  #   expect(page).to have_text('Ford Escape Two Door Coupe SAW 2019')


  #   save_screenshot 'all_cars.png'

  # end


  scenario 'filter according to the make' do

    visit '/cars'

    # select Ford from the make list

    save_screenshot("before_filter.png")

    within '.search-form' do
      select 'Ford', from: 'make'
      click_button 'Search!'
    end

    expect(page).to have_css('.car', count: 1)
    expect(page).to have_text('Ford Escape Two Door Coupe SAW 2019')

    save_screenshot 'filter_make.png'

  end




end
