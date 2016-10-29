class AddStoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :story_id, :integer
    add_column :users, :story_progress, :integer
  end
end
