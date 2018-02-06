class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :cancel, :start,:finish]
  before_action :authorize_customer
  before_action :authorize_admin, only: [:index, :edit, :update, :destroy]
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end


  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @time_diff = (@rental.end_date - @rental.start_date)/1.minute
  end

  # GET /rentals/new
  def new
    @rental = Rental.new(:car_id => params[:car_id], :customer_id => params[:customer_id])
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    respond_to do |format|
    if @rental.open_rental
      flash[:error] = "cannot create multiple renatals"
      @rental.destroy
      format.html { redirect_to '/car_search_list',notice: "cannot create multiple renatals" }
      format.json { render json: @rental.errors, status: :unprocessable_entity }
    elsif (@rental.start_date < Time.zone.now.to_datetime ||@rental.end_date < @rental.start_date ||
        (@rental.end_date - @rental.start_date) < 3.minute || @rental.end_date - @rental.start_date > 7.days )
      @rental.destroy
      format.html { redirect_to '/car_search_list',notice: "cannot create rental in past, \n rental cannot be less than 1 hour
                  \n rental cannot be 7 days in advance" }
      format.json { render json: @rental.errors, status: :unprocessable_entity }
      elsif @rental && @rental.save
        @rental.book
        time_delay_for_start =((@rental.start_date- Time.zone.now.to_datetime)/1.minutes) + 2
        @rental.delay(run_at: time_delay_for_start.minutes.from_now).cancel
        @time_for_end = ((@rental.end_date - Time.zone.now.to_datetime)/1.minutes)
        @rental.delay(run_at: @time_for_end.minutes.from_now).finish
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def history
    @history = nil
    if (params[:customer_id])
      customer = Customer.find(params[:customer_id])
      @history = Rental.where(:customer_id => customer.id)
    elsif (params[:car_id])
      car_license = Car.find(params[:car_id])
      @history = Rental.where(:car_id => car_license.id)
    end

  end
  def start
    @rental.start
  end
  def cancel
    @rental.cancel
    redirect_to @rental
  end
  def finish
    @rental.finish
  end
  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:car_id, :customer_id, :start_date, :end_date, :status)
    end
end
