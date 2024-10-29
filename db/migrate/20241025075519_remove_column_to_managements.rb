class RemoveColumnToManagements < ActiveRecord::Migration[7.0]
  def change
    remove_column :managements, :status
  end
end
