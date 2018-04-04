class TripsController < ApplicationController
  def index
  end

  def new

    @trip = Trip.new(date: Date.today, cost: random_cost)
  end

  def create
    pass_id = params[:id]

    @trip = Trip.new(trip_params)
    @trip.driver = Driver.first
    @trip.passenger = Passenger.find(27)

    if @trip.save
      redirect_to 'trips_path'
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
