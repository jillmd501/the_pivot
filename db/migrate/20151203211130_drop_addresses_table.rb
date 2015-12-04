class DropAddressesTable < ActiveRecord::Migration
  def up
    drop_table :addresses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
