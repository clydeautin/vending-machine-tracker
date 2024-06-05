class RenameSnacksIsInVendingMachineSnacks < ActiveRecord::Migration[7.1]
  def change
    rename_column :vending_machine_snacks, :snacks_id, :snack_id
  end
end
