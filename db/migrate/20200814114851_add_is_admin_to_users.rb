class AddIsAdminToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :is_admin, :boolean
  end

  def self.down
    remove_column :users, :is_admin, :boolean
  end
end