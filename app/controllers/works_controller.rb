class WorksController < ApplicationController
  def index
    # Premiere connextion a l'index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
    @work = Work.first if params[:work_id].nil?

    # suite navigation entre les show et contacs
    if request.referer.match(/[0-9]+$/) # <- Check if Url from request end with a number, witch means : from a show page
      show_id = request.referer.scan(/[0-9]+$/).join # <- Extract the id from the request referer
      @work = Work.find(show_id)
    else
      @work = Work.first
    end
  end

  def show
    @work = Work.find(params[:id])
    @works = Work.where(collection: @work.collection)
  end
end
