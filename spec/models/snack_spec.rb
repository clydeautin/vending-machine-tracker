require "rails_helper"

RSpec.describe Snack, type: :model do
  describe "relationships" do
    it { should have_many :vending_machine_snacks }
    it { should have_many(:machines).through(:vending_machine_snacks) }
  end
end