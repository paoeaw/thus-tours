class ToursController < ApplicationController
  def index
    @tour = Tour.last
  end
end
