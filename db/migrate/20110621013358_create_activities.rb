class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :title

      t.string :location

      t.datetime :start_at
      t.datetime :end_at
      t.text :synopsis
      t.text :description
      
      


      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
