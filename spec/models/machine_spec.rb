require "rails_helper"

RSpec.describe Machine, type: :model do
  describe "validations" do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it { should have_many :vending_machine_snacks}
    it { should have_many(:snacks).through(:vending_machine_snacks)}
  end

  describe "methods" do
    it "can give the average price of snacks in a machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    ice_t  = dons.snacks.create(name: "Iced Tea", price: 1.50)
    matcha_b  = dons.snacks.create(name: "Matcha Boba", price: 5.00)
    gatorade  = dons.snacks.create(name: "Gatorade", price: 2.50)

    expect(dons.average_price).to eq(3.00)
    end
  end
end
