class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def create
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = Car.new(car_params)
    @car.manufacturer = @manufacturer
    if @car.save
      flash[:notice] = "Success!"
      redirect_to cars_path
    else
      flash.now[:notice] = "Error"
      render 'manufacturers/show'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage)
  end
end
