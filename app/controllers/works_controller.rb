class WorksController < ApplicationController
  before_action :set_video_size

  def index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
    @work = Work.last
    @work = Work.find(params[:showed_work].to_i) if params[:showed_work].present?
  end

  def show
    @work = Work.find(params[:id])
    @works = Work.where(collection: @work.collection)
  end

  private

  def set_video_size
    if browser.device.mobile?
      @width = 296
      @height = 200
    else
      @width = 376
      @height = 280
    end
  end
end
