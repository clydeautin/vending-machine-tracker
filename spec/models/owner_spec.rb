require "rails_helper"

RSpec.describe Owner, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should have_many :machines }
    it { should have_many(:snacks).through(:machines) }
  end
end
