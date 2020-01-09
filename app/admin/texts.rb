ActiveAdmin.register Text do

  permit_params :title_fr, :title_en, :author, :content_fr, :content_en, :year

end
