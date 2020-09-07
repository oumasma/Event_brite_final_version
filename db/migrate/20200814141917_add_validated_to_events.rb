class AddValidatedToEvents < ActiveRecord::Migration[5.2]
  def self.up
    add_column :events, :validated, :boolean
  end

  def self.down
    remove_column :events, :validated, :boolean
  end
end
