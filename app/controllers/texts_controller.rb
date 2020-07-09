class TextsController < ApplicationController
  def show
    if locale == :fr
      @texts = Text.all.order(year: :desc)
      @text = Text.all.order(year: :desc).first
      @text = Text.find(params[:id]) if params[:id]
      @content = @text.content_fr
      @title = @text.title_fr


    else
      @texts = Text.all.order(year: :desc)
      @text = Text.all.order(year: :desc).first
      @text = Text.find(params[:id]) if params[:id]
      @content = @text.content_en
      @title = @text.title_en
    end
  end
end
