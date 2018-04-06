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
      @trip.cost = random_cost
    end

    if @trip.save
      redirect_to trip_path(@trip)
    else
      redirect_to passenger_path(pass_id)
    end

  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
    if @trip == nil
      redirect_to catch_all_index_path
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.assign_attributes(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
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
