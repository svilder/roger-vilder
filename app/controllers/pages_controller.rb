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
    if locale == :fr
      @texts = Text.all.order(year: :desc)
      if params[:id]
        raise
        @text = Text.find(params[:id])
        @content = @text.content_fr
        @title = @text.title_fr
      end
    else
      @texts = Text.all.order(year: :desc)
      if params[:id]
        @text = Text.find(params[:id])
        @content = @text.content_en
        @title = @text.title_en
      end
    end
  end

  def films
  end
end
