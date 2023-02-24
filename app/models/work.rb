class Work < ApplicationRecord

  has_one_attached :photo

  DISPLAY_CATEGORIES = {
    video: 'Vimeo',
    image: 'Image',
    animation: 'Js_animation'
  }.freeze

  DisplayOptions = Struct.new(:video, :image, :animation)

  COLLECTIONS = ["Kinetic", "Neon", "Sculptur", "Drawing", "Photo", "Animation", "Video"]

  def self.display_options
    DisplayOptions.new.tap do |options|
      options.video = DISPLAY_CATEGORIES[:video]
      options.image = DISPLAY_CATEGORIES[:image]
      options.animation = DISPLAY_CATEGORIES[:animation]
    end
  end

  def static_content?
    display_option == Work.display_options.image || display_option == Work.display_options.video && video_key.nil? || video_key == ""
  end
end


