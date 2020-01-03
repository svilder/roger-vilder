ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel link_to("Toutes les pièces", admin_works_path) do
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
