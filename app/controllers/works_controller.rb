class WorksController < ApplicationController
  before_action :set_video_size

  def index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic").order(year: :desc)
    else
      @works = Work.where(collection: params[:collection]).order(year: :desc)
    end
    # params[:showed_work] ? @work = Work.find(params[:showed_work].to_i) : @work = Work.last
  end

  def show
    if params[:id].nil?
      @work = Work.last
    else
      @work = Work.find(params[:id])
    end

    @previous_work = @work.previous
    @next_work = @work.next

    # if @previous_work.nil?
    #   @previous_work = Work.find(params[:id])
    # else
    #   @previous_work = @work.previous
    # end

    # if @next_work.nil?
    #   @next_work = Work.find(params[:id])
    # else
    #   @next_work = @work.next
    # end
  end

  private

  def set_video_size
    if browser.device.mobile?
      @width = 296
      @height = 200
    else
      @width = 680
      @height = 472
    end
  end
end
