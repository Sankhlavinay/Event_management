class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_deleted, :boolean
  end
end
