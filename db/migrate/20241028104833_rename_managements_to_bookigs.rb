class RenameManagementsToBookigs < ActiveRecord::Migration[7.0]
  def change
    rename_table :managements, :bookings
    drop_table :tickets
  end
end
