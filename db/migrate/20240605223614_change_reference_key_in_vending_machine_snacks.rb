class ChangeReferenceKeyInVendingMachineSnacks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :vending_machine_snacks, :owner, foreign_key: true
    add_reference :vending_machine_snacks, :machine, foreign_key: true
  end
end
