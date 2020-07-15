ActiveAdmin.register Work do
  config.per_page = 8
  menu label: "Toutes les pièces"
  menu priority: 1

  filter :collection, as: :check_boxes, collection: proc { Work::COLLECTIONS }

  action_item :view_site do
    link_to "Voir le site", works_path, target: "_blank"
  end

  action_item :view do
    link_to "Retour sur l'index des pièces", admin_works_path
  end

  # controller do
  #   def delete_photo
  #     work.photo.purge
  #   end
  # end

  # member_action :delete_photo, method: :delete do
  #  @photo = ActiveStorage::Attachment.find(params[:id])
  #  @photo.purge_later
  #  redirect_back(fallback_location: admin_works_path)
  # end

  controller do
    def create
      super do |format|
        redirect_to admin_works_path and return
      end
    end
    def update
      super do |format|
        redirect_to admin_works_path and return
      end
    end
    def destroy
      super do |format|
        redirect_to admin_works_path and return
      end
    end
  end

  index do
    selectable_column
    column "Photo" do |work|
      instance_image_tag work.photo, height: 150, width: 150, crop: :fill
    end
    column "Pièce", sortable: :name do |work|
      link_to work.name, admin_work_path(work)
    end
    column "Année", sortable: :year do |work|
      link_to work.year, admin_work_path(work)
    end
    column "Collection" do |work|
      link_to work.collection, admin_work_path(work)
    end
    column "id", sortable: :id do |work|
      link_to work.id, admin_work_path(work)
    end
    actions
  end

  permit_params :name, :description, :dimensions, :year, :image, :youtube_link, :category, :collection, :photo

  form title: 'Nouvelle piece' do |f|
    inputs "Infos" do
      input :name, placeholder: 'Circonvolutions 17'
      input :description, label: 'Description', placeholder: 'Musée Pompidou, ou toute autre précision'
      input :dimensions, label: 'Dimensions', placeholder:'Format : 150 x 150 x 18 cm'
      input :year, label: 'Année', placeholder:'2040'
      input :collection, collection: Work::COLLECTIONS, label: 'Collection', include_blank: false
      input :category, collection: Work::CATEGORIES, label: 'Categorie', include_blank: false
    end
    inputs "Images" do
      input :youtube_link, label: 'Lien Youtube', placeholder:'Format : chiffres et lettres après : [https://www.youtube.com/watch?v=] ex: 9PhhMhKAF2o '
      input :photo, as: :file, label: "Photo"
    end
    actions
  end
end
