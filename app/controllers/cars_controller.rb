class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin , only: [:show, :edit, :update, :destroy, :index]
  # GET /cars
  # GET /cars.json

  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new(:manufacturer => params[:manufacturer ], :model => params[:model],:style=> params[:style])
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    rental = nil
    rental = Rental.find_by_car_id_and_status(@car.id, "booked")
    if rental
      rental.cancel
      rental.destroy
    end
    rental = nil
    rental = Rental.find_by_car_id_and_status(@car.id, "checked_out")
    if rental
      rental.cancel
      rental.destroy
      
    end
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list
    if params[:customer_id]
      @customer_id = params[:customer_id]
    end
    @cars = Car.all
    @location = params[:location]
    @manufacturer = params[:manufacturer]
    @model = params[:model]
    @style = params[:style]
    @status = params[:status]
    if(!@location.blank?)
      @cars = @cars.where(:location => @location)
    end
    if(!@manufacturer.blank?)
      @cars = @cars.where(:manufacturer => @manufacturer)
    end
    if(!@model.blank?)
      @cars = @cars.where(:model => @model)
    end
    if(!@style.blank?)
      @cars = @cars.where(:style => @style)
    end
    if(!@status.blank?)
      @cars = @cars.where(:status => @status)
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:licenseplate, :manufacturer, :model, :hour_rental, :style, :location, :status)
    end
end

