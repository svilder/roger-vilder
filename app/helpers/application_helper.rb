module ApplicationHelper
  def instance_image_tag(photo, options = {})
    if photo.attached?
      cl_image_tag photo.key, options
    else
      image_tag "no-picture.png", options
    end
    # if cloud_image
      # cl_image_tag cloud_image, options
    # else
      # cl_image_tag photo.key, options
    # end
  end
end
