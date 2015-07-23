class AddColumnToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :theme, :string
  end
end
