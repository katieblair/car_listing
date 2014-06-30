require 'rails_helper'

feature 'user adds a car', %Q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
) do

# Acceptance Criteria:

# I must specify the manufacturer, color, year, and mileage of the car.
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded
# and I am presented with a notification of success
# If I do not specify all of the required information in the required formats,
# the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'salesperson adds a car' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit manufacturer_path(manufacturer)

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    click_on 'Create Car'

    expect(page).to have_content('Success')
    expect(page).to have_content car.color
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
  end

  scenario 'salesperson does not specify the required information' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit manufacturer_path(manufacturer)

    click_on 'Create Car'

    expect(page).to_not have_content('Success')
    expect(page).to have_content('Error')
  end

end
