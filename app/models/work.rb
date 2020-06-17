class Work < ApplicationRecord
  has_one_attached :photo

  CATEGORIES = ["Kinetics", "Statics"]
  COLLECTIONS = ["Kinetic", "Sculptur", "Drawing", "Photo", "Animation", "Video"]

  # validates :category, presence: true, inclusion: { in: CATEGORIES }
  # validates :collection, presence: true, inclusion: { in: COLLECTIONS }
  # validates :name, presence: true
  # validates :year, presence: true
  # validates :dimensions, presence: true


  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

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
