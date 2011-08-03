class AddMamaFieldsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :subtitle, :string
    add_column :events, :level, :integer
    add_column :events, :combined_level, :integer
  end

  def self.down
    remove_column :events, :subtitle
    remove_column :events, :level
    remove_column :events, :combined_level
  end

end
