class CreateFellows < ActiveRecord::Migration
  def change
    create_table :fellows do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.belongs_to :session, :index => true
      t.timestamps null: false
    end
  end
end
