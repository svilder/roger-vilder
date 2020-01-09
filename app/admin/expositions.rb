ActiveAdmin.register Exposition do
  permit_params :title, :exhibition, :city, :category, :year

  form title: "Exposition" do |f|
    inputs "Exposition" do
      f.input :category, label: "Type d'exposition", collection: Exposition::EXPOSITIONS_CATEGORIES
      f.input :title, placeholder: "Nom de l exposition"
      f.input :year, placeholder: "2019"
      f.input :city, placeholder: "Paris"
      f.input :exhibition, label: "lieu d'exposition", placeholder: "Centre Pompidou"
      f.input :associates, label: " Facultatif: Artistes ayant participés", placeholder: " Salvator Dali et Rembrandt"
    end
  end
end
