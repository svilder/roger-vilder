class WorksController < ApplicationController
  def index
    @work = Work.last
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
  end
end
