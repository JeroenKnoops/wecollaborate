class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :sort_order
      
      t.timestamps
    end
    
    ["Social", "Art", "Business", "Technology", "Hobby"].each_with_index do |c, i|
      Category.create title: c, sort_order: i
    end
  end
end
