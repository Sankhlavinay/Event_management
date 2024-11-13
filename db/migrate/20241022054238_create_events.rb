class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.time :time
      t.decimal :ticket_price, precision: 5, scale: 2
      t.integer :available_ticket
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

