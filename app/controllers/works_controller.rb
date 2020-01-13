class WorksController < ApplicationController
  def index
    # Premiere connextion a l'index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
    @work = Work.first
    @work = Work.find(params[:showed_work].to_i) if params[:showed_work].present?
  end

  def show
    @work = Work.find(params[:id])
    @works = Work.where(collection: @work.collection)
  end
end
