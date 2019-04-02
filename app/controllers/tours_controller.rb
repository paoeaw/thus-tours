class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tours = policy_scope(Tour).order(created_at: :desc)
  end

  def show
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def update
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def create
    @tour = Tour.new(tour_params)
    authorize @tour
    @tour.provider = current_user
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def destroy
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.destroy

    redirect_to tours_path
  end

  private

  def tour_params
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:tour).permit(:name, :photo, :details, :cost, :location)
  end
end
