class WorksController < ApplicationController
  before_action :set_video_size, :set_default_text

  def index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic").order(year: :desc).order(name: :asc)
    else
      @works = Work.where(collection: params[:collection]).order(year: :desc).order(name: :asc)
    end
  end

  def show
    if params[:id].nil?
      @work = Work.last
    else
      @work = Work.find(params[:id])
    end

    @works = Work.all.order(collection: :desc).order(year: :desc).order(name: :asc)
    works_hash = Hash.new
    @works.each_with_index { |work, index| works_hash[work] = index }

    if @previous_work.nil?
      @previous_work = works_hash.key(works_hash[@work] - 2)
    else
      @previous_work = works_hash.key(works_hash[@work] - 1)
    end

    if @next_work.nil?
      @next_work = works_hash.key(works_hash[@work] + 2)
    else
      @next_work = works_hash.key(works_hash[@work] + 1)
    end
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
