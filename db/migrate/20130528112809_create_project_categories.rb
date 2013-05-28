class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.integer :project_id
      t.integer :category_id
      t.integer :weight

      t.timestamps
    end
  end
end
