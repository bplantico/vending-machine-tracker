require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "they see the name of all the snacks in that machine along with their prices" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = dons.snacks.create!(name: "Lays", price: 1)
    twix = dons.snacks.create!(name: "Twix", price: 1)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")

    require "pry"; binding.pry
    
  end
  # As a user
  # When I visit a vending machine show page
  # I see the name of all of the snacks associated with that vending machine along with their price

end
