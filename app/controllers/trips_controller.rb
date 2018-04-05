class TripsController < ApplicationController
  def index
  end

  def new
  end

  def create
    pass_id = params[:passenger_id]

    if pass_id
      @trip = Trip.new(passenger_id: params[:passenger_id])
      @trip.driver = Driver.next_driver
      @trip.date = Date.today
    end

    if @trip.save
      redirect_to trip_path(@trip)
    else
      redirect_to passenger_path(pass_id)
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
