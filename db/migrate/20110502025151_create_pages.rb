class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :permalink
      t.text :description
      t.boolean :is_public
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
