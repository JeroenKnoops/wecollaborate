class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :title
      t.integer :sort_order
      t.string :color
      t.timestamps
    end
    
    ["Concept"].each_with_index do |p,i|
      Phase.create title: p, sort_order: i, color: "red" 
    end
    
  end
end
