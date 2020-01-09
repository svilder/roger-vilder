class WorksController < ApplicationController
  def index

    if params[:work_id].nil?
      @work = Work.last
    else
      @work = Work.find(params[:work_id])
    end
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
  end
end
