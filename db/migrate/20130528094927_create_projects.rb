class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :project_image_url
      t.integer :initiator_id
      t.integer :phase_id
      t.string :phrase
      t.string :project_type
      t.text :details
      t.boolean :status

      t.timestamps
    end
  end
end
