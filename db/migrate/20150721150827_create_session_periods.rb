class CreateSessionPeriods < ActiveRecord::Migration
  def change
    create_table :session_periods do |t|
      t.belongs_to :day, :index => true
      t.belongs_to :session, :index => true
      t.timestamps null: false
    end
  end
end
