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

    @driver = Driver.find_by(id: driver_id)

    if @driver == nil
      redirect_to catch_all_index_path
    else
      @trips = @driver.trips
    end

  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.assign_attributes(driver_params)

    if @driver.save
      redirect_to driver_path(@driver)
    else
      render :edit
    end
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.deactivate_user

    @driver.destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :car_make, :car_model)

  end
end
