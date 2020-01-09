ActiveAdmin.register Exhibition do

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
  end
end
