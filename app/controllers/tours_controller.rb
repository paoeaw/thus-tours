class ToursController < ApplicationController
  def index
    # for testing purposes -- change to Tour.all when ready
    @tour = Tour.last
  end

  def show
    @tour = Tour.find[params[:id]]
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    redirect_to tours_path
  end

  private

  def tour_params
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:tour).permit(:name, :photo)
  end
end
