class TripsController < ApplicationController
  def index
  end

  def new
    pass_id = params[:id]
    @trip = Trip.new(date: Date.today, cost: random_cost, passenger: Passenger.find(pass_id))
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.driver  = Driver.first

    if @trip.save
      redirect_to 'trip_path'
    else
      render :new
    end

  end

  def show
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def trip_params
    return params.require(:trip).permit(:rating)
  end

  def random_cost
    return rand(1001..3000)
  end
end
