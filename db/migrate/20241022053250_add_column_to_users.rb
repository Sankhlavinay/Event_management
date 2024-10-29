class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    add_column :users, :stripe_user_id, :string
  end
end
