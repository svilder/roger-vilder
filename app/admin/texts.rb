ActiveAdmin.register Text do

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
  end

end
