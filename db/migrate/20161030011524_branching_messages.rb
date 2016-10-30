class BranchingMessages < ActiveRecord::Migration
  def change
    add_column :messages, :branches, :boolean, default: false
    add_column :messages, :branches_to_one, :integer
    add_column :messages, :branches_to_two, :integer
  end
end
