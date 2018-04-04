class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to '/drivers'
    else
      render :new
    end
  end

  def show
    driver_id = params[:id]

    @driver = Driver.find(driver_id)
    @trips = @driver.trips
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :car_make, :car_model)

  end
end
