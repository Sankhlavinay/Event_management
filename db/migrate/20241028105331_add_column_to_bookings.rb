class AddColumnToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :price_paid, :float
    add_column :bookings, :no_of_tickets, :integer
    add_column :bookings, :stripe_transaction_id, :integer
  end
end
