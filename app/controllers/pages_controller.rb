class PagesController < ApplicationController

  def home
    phrase = "Roger Vilder".upcase
    @letters = phrase.split(//)
  end

  def contact
    # developpement exhibitions
    @temp_exhibitions = Exhibition.all

    # Production exhibitions
    # @personal_exhibitions = Exhibition.where(collection: "Expositions personelles")
    # @collective_exhibitions = Exhibition.where(collection: "Expositions collectives")
    # @permanent_exhibitions = Exhibition.where(collection: "Collection publiques et privées")
  end
end
