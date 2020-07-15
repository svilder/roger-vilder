ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  action_item :view_site do
    link_to "Voir le site", root_path, target: "_blank"
  end
  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel link_to("Les 5 dernières pièces", admin_works_path) do
          ul do
            Work.last(5).map do |work|
              li link_to(work.name, admin_work_path(work))
            end
          end
        end
      end
    end
  end
end

ActiveAdmin.setup do |config|
  config.comments = false
end
