class PagesController < ApplicationController
  def home
  end

  def about
    @personal_exhibitions = Exhibition.where(category: "Expositions personelles").order(year: :desc)
    @collective_exhibitions = Exhibition.where(category: "Expositions collectives").order(year: :desc)
    @permanent_exhibitions = Exhibition.where(category: "Collection publiques et privées").order(year: :desc)
    @bibliographies = Bibliography.all.order(year: :desc)
  end

  def texts
    @texts = Text.all.order(year: :desc)
  end

  def films
  end
end
