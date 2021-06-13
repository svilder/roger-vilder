class Work < ApplicationRecord
  has_one_attached :photo

  DISPLAY_OPTIONS = ["Vimeo", "Image", "Js_animation"]
  COLLECTIONS = ["Kinetic", "Neon", "Sculptur", "Drawing", "Photo", "Animation", "Video"]

  # validates :display_option, presence: true, inclusion: { in: DISPLAY_OPTIONS }
  # validates :collection, presence: true, inclusion: { in: COLLECTIONS }
  # validates :name, presence: true
  # validates :year, presence: true
  # validates :dimensions, presence: true

  private

  def self.year
    return work.year unless work.year == "" || work.year.nil? || work.year == "."
  end

  def self.description
    return work.description unless work.description == "" || work.description.nil? || work.description == "."
  end

  def self.dimensions
    return work.dimensions unless work.dimensions == "" || work.dimensions.nil? || work.dimensions == "."
  end
end
