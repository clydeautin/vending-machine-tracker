class AddSnacksToVendingMachineSnacks < ActiveRecord::Migration[7.1]
  def change
    add_reference :vending_machine_snacks, :snacks, null: false, foreign_key: true
  end
end
