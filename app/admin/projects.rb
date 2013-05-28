ActiveAdmin.register Project do
  scope :inactive
  
    index do
      column :title
      column :initiator, :sortable => :initiator_id
      column :phase, :sortable  => :phase_id
      column "Created at", :created_at
      default_actions
    end
    
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :project_image_url
      f.input :phrase
      f.input :initiator
      f.input :phase
      f.input :project_type
      f.input :details, :input_html => { :class => "tinymce" }
      f.input :status, :label => "Active?", :as => :boolean
    end
    
    f.inputs :skills
    f.inputs :categories
    f.actions
  end  
end
