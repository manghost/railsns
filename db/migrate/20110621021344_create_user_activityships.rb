class CreateUserActivityships < ActiveRecord::Migration
  def self.up
    create_table :user_activityships do |t|
      t.integer :user_id, :nil => false
      t.integer :activity_id, :nil => false
      t.boolean :owner, :default => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :user_activityships
  end
end
