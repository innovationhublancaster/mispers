class AddContinueToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :continue, :boolean, default: true
  end
end
