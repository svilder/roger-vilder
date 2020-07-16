ActiveAdmin.register Text do
  config.filters = false
  menu priority: 4

  action_item :view_site do
    link_to "Voir le site", root_path, target: "_blank"
  end

  action_item :view do
    link_to "Retour sur l'index des textes", "/admin/texts"
  end

  controller do
    def create
      super do |format|
        redirect_to admin_texts_path and return
      end
    end
    def update
      super do |format|
        redirect_to admin_texts_path and return
      end
    end
    def destroy
      super do |format|
        redirect_to admin_texts_path and return
      end
    end
  end

  index do
    selectable_column
    column "Titre fr", sortable: :title_fr do |text|
      link_to text.title_fr, admin_text_path(text)
    end
    column "Titre en", sortable: :title_en do |text|
      link_to text.title_en, admin_text_path(text)
    end
    column "Auteur", sortable: :author do |text|
      link_to text.author, admin_text_path(text)
    end
    column "Année", sortable: :year do |text|
      link_to text.year, admin_text_path(text)
    end
    column "id", sortable: :id do |text|
      link_to text.id, admin_text_path(text)
    end
    actions
  end

  permit_params :title_fr, :title_en, :author, :content_fr, :content_en, :year

  form title: "Textes" do |f|
    inputs "Textes" do
      inputs "Version française" do
        f.input :title_fr, label: "Titre (Français)", placeholder: ""
        f.input :content_fr, label: "Texte (Français)", placeholder: ""
      end
      inputs "Version anglaise" do
        f.input :title_en, label: "Titre (Anglais)", placeholder: ""
        f.input :content_en, label: "Texte (Anglais)", placeholder: ""
      end
      inputs "Auteur / Année" do
        f.input :author, label: "Auteur", placeholder: ""
        f.input :year, label: "Année de Parution", placeholder: ""
      end
    end
    actions
  end
end
