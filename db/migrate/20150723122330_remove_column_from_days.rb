class RemoveColumnFromDays < ActiveRecord::Migration
  def change
    remove_column :days, :theme, :string
  end
end
