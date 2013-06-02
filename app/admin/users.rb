ActiveAdmin.register User do
  index do
    column "Fullname", :fullname
    column "Email", :email
    column "Last login", :updated_at
    default_actions
  end
  
  # form do |f|
  #   f.inputs do 
  #     f.input :body, :input_html => { :class => "tinymce" }
  #   end
  # end
end
