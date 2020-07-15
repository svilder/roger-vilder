ActiveAdmin.register Exhibition do
  menu priority: 2
  config.filters = true

  filter :category, as: :check_boxes, collection: proc { Exhibition::EXHIBITIONS_CATEGORIES }

  action_item :view_site do
    link_to "Voir le site", about_path, target: "_blank"
  end

  action_item :view do
    link_to "Retour sur l'index des expositions", "/admin/exhibitions"
  end

  controller do
    def create
      super do |format|
        redirect_to admin_exhibitions_path and return
      end
    end
    def update
      super do |format|
        redirect_to admin_exhibitions_path and return
      end
    end
    def destroy
      super do |format|
        redirect_to admin_exhibitions_path and return
      end
    end
  end

  index do
    selectable_column
    column "Année", sortable: :year do |exhibition|
      link_to exhibition.year, admin_exhibition_path(exhibition)
    end
    column "Ville", sortable: :city do |exhibition|
      link_to exhibition.city, admin_exhibition_path(exhibition)
    end
    column "Lieu d'exposition", sortable: :place do |exhibition|
      link_to exhibition.place, admin_exhibition_path(exhibition)
    end
    column "Type d'exposition" do |exhibition|
      link_to exhibition.category, admin_exhibition_path(exhibition)
    end
    column "id", sortable: :id do |exhibition|
      link_to exhibition.id, admin_exhibition_path(exhibition)
    end
    actions
  end

  permit_params :title, :place, :city, :category, :year

  form title: "Exposition" do |f|
    inputs "Exposition" do
      f.input :category, label: "Type d'exposition", collection: Exhibition::EXHIBITIONS_CATEGORIES
      f.input :title, label: "Titre de l'exposition", placeholder: "Nom de l exposition"
      f.input :year, label: "Année", placeholder: "2019"
      f.input :city, label: "Ville", placeholder: "Paris"
      f.input :place, label: "Lieu d'exposition", placeholder: "Centre Pompidou"
      f.input :associates, label: " Facultatif: Artistes ayant participés", placeholder: " Salvator Dali et Rembrandt"
    end
    actions
  end
end
