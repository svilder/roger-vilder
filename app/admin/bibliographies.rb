ActiveAdmin.register Bibliography do

  permit_params :author, :title, :year, :month

  form title: "Bibliographie" do |f|
    inputs "Bibliographie" do
      f.input :title, label: "Titre", placeholder: ""
      f.input :author, label: "Auteur", placeholder: ""
      f.input :year, label: "Année de publication", placeholder: "2019"
      f.input :month, label: "Mois de publication (en lettres)", placeholder: "Janvier"
    end
  end

end
