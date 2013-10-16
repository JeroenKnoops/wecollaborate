class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :speciality_one
      t.string :speciality_two
      t.string :speciality_three
      t.string :project_title
      t.text :project_description
      t.string :jam
      t.boolean :newsletter

      t.timestamps
    end
  end
end
