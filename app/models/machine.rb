class Machine < ApplicationRecord
  validates_presence_of :location
  
  belongs_to :owner
  has_many :vending_machine_snacks
  has_many :snacks, through: :vending_machine_snacks

  def average_price
    snacks.average(:price)
  end

  def snack_count
    snacks.count
  end
end
