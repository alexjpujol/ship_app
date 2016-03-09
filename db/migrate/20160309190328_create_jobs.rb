class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :boat_id
      t.integer :user_id
      t.integer :containers_needed
      t.string :cargo
      t.integer :cost
      t.string :destination

      t.timestamps null: false
    end
  end
end
