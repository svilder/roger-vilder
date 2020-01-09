class WorksController < ApplicationController
  def index
    @work = Work.last
    if params[:collection].nil?
      @works = Work.all
    else
      @works = Work.where(collection: params[:collection]).shuffle
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  private

  def work_params
    params.require(:work).permit(:name, :description, :dimensions, :year, :image, :youtube_link, :category, :collection, :photo)
  end
end
