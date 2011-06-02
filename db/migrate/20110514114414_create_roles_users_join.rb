class CreateRolesUsersJoin < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.integer :role_id, :nil => false
      t.integer :user_id, :nil => false
    end
  
	admin_user = User.create(:username => 'Admin',
							  :email => 'admin@railsns.com',
							  :profile => 'Site Administrator',
							  :password => 'admin',:password_confirmation => 'admin')
	admin_role = Role.find_by_name('Administrator')
	admin_user.roles << admin_role
	end			

  def self.down
	drop_table :roles_users
	User.find_by_name('Admin').destroy
  end
end
