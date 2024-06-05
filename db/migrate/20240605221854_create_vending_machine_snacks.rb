class CreateVendingMachineSnacks < ActiveRecord::Migration[7.1]
  def change
    create_table :vending_machine_snacks do |t|
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
