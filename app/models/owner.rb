class Owner < ApplicationRecord
  validates_presence_of :name

  has_many :machines
  has_many :snacks, through: :machines
end
