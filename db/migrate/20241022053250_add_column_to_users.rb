class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    add_column :users, :stripe_user_id, :string
    add_column :users, :full_name, :string
    add_column :users, :contact_number, :string
  end
end
