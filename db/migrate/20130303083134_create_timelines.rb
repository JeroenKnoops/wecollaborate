class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :title
      t.datetime :timestamp
      t.text :description
      t.boolean :is_public
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
