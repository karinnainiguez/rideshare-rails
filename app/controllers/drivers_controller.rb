class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
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
