require 'rails_helper'

feature 'user adds a manufacturer', %Q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
) do

# Acceptance Criteria:

# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

  scenario 'salesperson adds a manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Create Manufacturer'

    expect(page).to have_content('Success')
    expect(page).to have_content manufacturer.name
  end

  scenario 'salesperson does not specify the required information' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path

    click_on 'Create Manufacturer'

    expect(page).to_not have_content('Success')
    expect(page).to have_content('Error')
  end

end
