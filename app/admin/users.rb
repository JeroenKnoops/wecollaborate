ActiveAdmin.register User do
  index do
    column "Email", :email
    column "Last login", :updated_at
    default_actions
  end
end
