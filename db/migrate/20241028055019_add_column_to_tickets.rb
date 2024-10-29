class AddColumnToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :no_of_tickets, :integer
    rename_column :tickets, :price, :price_paid
    change_column :tickets, :price_paid, :float
    change_column :events, :ticket_price, :float
  end
end
