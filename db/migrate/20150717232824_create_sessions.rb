class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :start_time
      t.string :end_time
      t.timestamps null: false
    end
  end
end
