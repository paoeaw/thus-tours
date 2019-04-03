class Providers::ToursController < ApplicationController
  def index
    tours = policy_scope(Tour).order(created_at: :desc)
    @tours = tours.where(provider: current_user)
  end

  def edit
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def update
  end

  def destroy
  end
end
