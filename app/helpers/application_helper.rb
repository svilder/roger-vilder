module ApplicationHelper
  def instance_image_tag(photo, options = {})
    if photo.attached?
      cl_image_tag photo.key, options
    else
      image_tag "no-picture.png", options
    end
  end

  def youtube_video(url, height, width)
    render :partial => 'shared/video', :locals => { :url => url, :height => height, :width => width }
  end

  def vimeo_video(key)
    render :partial => 'shared/video', :locals => { :key => key }
  end
end
