class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :perspective

      t.timestamps null: false
    end
  end
end
