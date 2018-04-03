class TripsController < ApplicationController
  def index
  end

  def new
    @trip = Trip.new(date: Date.today)
  end

  def create
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
