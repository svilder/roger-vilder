ActiveAdmin.register Bibliography do
  config.filters = false
  menu priority: 3

  action_item :view_site do
    link_to "Voir le site", about_path, target: "_blank"
  end

  action_item :view do
    link_to "Retour sur l'index des bibliographies", "/admin/bibliographies"
  end

  controller do
    def create
      super do |format|
        redirect_to admin_bibliographies_path and return
      end
    end
    def update
      super do |format|
        redirect_to admin_bibliographies_path and return
      end
    end
    def destroy
      super do |format|
        redirect_to admin_bibliographies_path and return
      end
    end
  end

  index do
    selectable_column
    column "Titre", sortable: :title do |bibliography|
      link_to bibliography.title, admin_bibliography_path(bibliography)
    end
    column "Auteur", sortable: :author do |bibliography|
      link_to bibliography.author, admin_bibliography_path(bibliography)
    end
    column "Année", sortable: :year do |bibliography|
      link_to bibliography.year, admin_bibliography_path(bibliography)
    end
    column "id", sortable: :id do |bibliography|
      link_to bibliography.id, admin_bibliography_path(bibliography)
    end
    actions
  end

  permit_params :author, :title, :year, :month

  form title: "Bibliographie" do |f|
    inputs "Bibliographie" do
      f.input :title, label: "Titre", placeholder: ""
      f.input :author, label: "Auteur", placeholder: ""
      f.input :year, label: "Année de publication", placeholder: "2019"
      f.input :month, label: "Mois de publication (en lettres)", placeholder: "Janvier"
    end
    actions
  end
end
