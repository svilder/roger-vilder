module ApplicationHelper
  def instance_image_tag(photo, options = {})
    if photo.attached?
      cl_image_tag photo.key, options
    else
      image_tag "no-picture.png", options
    end
  end
end
