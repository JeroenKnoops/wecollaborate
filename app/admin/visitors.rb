ActiveAdmin.register Visitor do
  index do
    column "name", :name
    column "Email", :email
    column "Speciality One", :speciality_one
    default_actions
  end
  
  # form do |f|
  #   f.inputs do 
  #     f.input :body, :input_html => { :class => "tinymce" }
  #   end
  # end
end
