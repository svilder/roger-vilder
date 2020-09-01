module ApplicationHelper
  def instance_image_tag(photo, options = {})
    if photo.attached?
      cl_image_tag photo.key, options
    else
      image_tag "no-picture.png", options
    end
  end

  def vimeo_video(key)
    render :partial => 'shared/video', :locals => { :key => key }
  end

  def render_previous_work(works_hash, work)
    if works_hash[work] == 0
      render :partial => 'shared/no_work_link'
    else
      previous_work = works_hash.key(works_hash[work] - 1)
      render :partial => 'shared/previous_work_link', :locals => { :id => previous_work.id }
    end
  end

  def render_next_work(works_hash, work)
    if works_hash[work] == (works_hash.length - 1)
      render :partial => 'shared/no_work_link'
    else
      next_work = works_hash.key(works_hash[work] + 1)
      render :partial => 'shared/next_work_link', :locals => { :id => next_work.id }
    end
  end
end



