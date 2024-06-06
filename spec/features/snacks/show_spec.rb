require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do

  # User Story 3 of 3

  # As a visitor
  # When I visit a snack show page
  #[]I see the name of that snack
  #[]   and I see the price for that snack
  #[]  and I see a list of locations with vending machines that carry that snack
  #[]  and I see the average price for snacks in those vending machines
  #[]  and I see a count of the different kinds of items in that vending machine.
  it 'willl show all details of that snack availability' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    gkrwc = owner.machines.create(location: "Game Kastle RWC")
    all_sc = owner.machines.create(location: "All Star Cleaners")
    ice_t  = Snack.create(name: "Iced Tea", price: 1.50)
    matcha_b  = Snack.create(name: "Matcha Boba", price: 5.00)
    americano = Snack.create(name: "Americano", price: 2.00)
    g_beer = Snack.create(name: "Ginger Beer", price: 2.00)

    vms1 = VendingMachineSnack.create(machine: dons, snack: ice_t)
    vms2 = VendingMachineSnack.create(machine: dons, snack: matcha_b)

    vms3 = VendingMachineSnack.create(machine: gkrwc, snack: matcha_b)
    vms4 = VendingMachineSnack.create(machine: gkrwc, snack: americano)
    vms5 = VendingMachineSnack.create(machine: gkrwc, snack: g_beer)

    vms6 = VendingMachineSnack.create(machine: all_sc, snack:g_beer),

    visit snacks_path(matcha_b)

    expect(page).to have_content("Name: #{matcha_b.name}")
    expect(page).to have_content("Price: $#{matcha_b.price}")
    expect(page).to have_content("Don's Mixed Drinks (2 kinds of snacks, average price of $3.25)")
    expect(page).to have_content("Don's Mixed Drinks (3 kinds of snacks, average price of $3.0)")
    expect(page).to_not have_content("All Star Cleaners")

    # need a model method to count the snack at a machine + model test
    # need a model to count the average price of snack at a machine + model test
  end
end
