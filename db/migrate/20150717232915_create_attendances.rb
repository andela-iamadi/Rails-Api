class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :attendance_confirmed, :default => false
      t.belongs_to :fellow, :index => true
      t.belongs_to :day, :index => true
      t.timestamps null: false
    end
  end
end
