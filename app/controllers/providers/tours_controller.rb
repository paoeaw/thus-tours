class Providers::ToursController < ApplicationController
  def index
    @tours = policy_scope(Tour).order(created_at: :desc)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
