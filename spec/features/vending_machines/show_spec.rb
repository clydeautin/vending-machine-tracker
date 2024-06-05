require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  #   User Story 1 of 3

  # As a visitor
  # When I visit a vending machine show page
  #[] I see the name of all of the snacks associated with that vending machine along with their price
  #[] and I also see an average price for all of the snacks in that machine. 
  it 'shows all the snacks and their prices for that machine and avg price of snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    ice_t  = dons.snacks.create(name: "Iced Tea", price: 1.50)
    matcha_b  = dons.snacks.create(name: "Matcha Boba", price: 5.00)
    gatorade  = dons.snacks.create(name: "Gatorade", price: 2.50)

    visit machine_path(dons)
    save_and_open_page
    dons.snacks.each do |snack|
      within "#snack-#{snack.id}" do
      expect(page).to have_content("#{snack.name}: $#{snack.price}")
      end
    end
    expect(page).to have_content("Average Price: $3.0")
  end
end
