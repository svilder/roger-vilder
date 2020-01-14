class PagesController < ApplicationController

  def home
    phrase = "Roger Vilder".upcase
    phrase = "RogerVilder".upcase if browser.device.mobile?
    @letters = phrase.split(//)
  end

  def contact
    # developpement exhibitions
    @temp_exhibitions = Exhibition.all
    # Production exhibitions
    @personal_exhibitions = Exhibition.where(category: "Expositions personelles")
    # @collective_exhibitions = Exhibition.where(category: "Expositions collectives")
    # @permanent_exhibitions = Exhibition.where(category: "Collection publiques et privées")
  end
end
