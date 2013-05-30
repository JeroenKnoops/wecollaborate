class AddProjectSmallImageUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_small_image_url, :string
  end
end
