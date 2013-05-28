ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Projects" do
          ul do
            Project.recent(5).map do |project|
              li link_to(project.title, [:admin, project])
            end
          end
        end
      end

      column do
        panel "Recent Users" do
          ul do
            User.recent(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end
    end

    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

  end # content
end
