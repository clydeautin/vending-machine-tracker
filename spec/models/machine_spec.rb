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
end
