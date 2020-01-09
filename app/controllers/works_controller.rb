class WorksController < ApplicationController
  def index
    if params[:collection].nil?
      @works = Work.where(collection: "Kinetic")
    else
      @works = Work.where(collection: params[:collection])
    end
    @work = Work.new
  end
end
