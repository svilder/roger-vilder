class WorksController < ApplicationController
  before_action :set_video_size

  def index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic").order(year: :desc)
    else
      @works = Work.where(collection: params[:collection]).order(year: :desc)
    end
  end

  def show
    if params[:id].nil?
      @work = Work.last
    else
      @work = Work.find(params[:id])
    end

    @previous_work = @work.previous
    @next_work = @work.next

    # if @work.previous.nil?
    #   id = (@work.id - 2).to_i
    #   @previous_work = Work.find_by(id: id)
    # else
    #   @previous_work = @work.previous
    # end

    # if @work.next.nil?
    #   id = (@work.id + 2).to_i
    #   @next_work = Work.find_by(id: id)
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
      @width = 780
      @height = 572
    end
  end
end
