class Snack < ApplicationRecord
  has_many :vending_machine_snacks
  has_many :machines, through: :vending_machine_snacks
end