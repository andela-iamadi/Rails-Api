class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :role, :default => "Fellow"
      t.belongs_to :fellow, :index => true
      t.timestamps null: false
    end
  end
end
