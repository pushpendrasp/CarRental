class CustomersController < ApplicationController
  before_action :set_customer,
                only: [:show, :edit, :update, :destroy,
                       :cancel_booking, :history]
  before_action :authorize_customer, only: [:show, :edit, :update]
   before_action :authorize_admin, only: [:index, :destroy]
  # # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end


  # GET /customers/1
  # GET /customers/1.json
  def show
    @booked = Rental.find_by_customer_id_and_status(@customer.id , "booked")
    if (@booked )
      @to_cancel = @booked
    end
    @checked_out = Rental.find_by_customer_id_and_status(@customer.id , "checked_out")
    finished = nil
    finished = Rental.where(:status => "finished", :customer_id => @customer.id)
    finished  = finished.reverse
    finished = finished.first
    @customer.rental_charge = '0.0'
    @customer.save
    if finished
      start_date = finished.start_date
      end_date = finished.end_date
      @customer.rental_charge = ((end_date - start_date) / 300 ) * (finished.get_car.hour_rental.to_f)
      @customer.save
    end

  end


  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def history
    @history = Rental.find_by_customer_email(@customer.email)
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    rental = nil
    rental = Rental.find_by_customer_id_and_status(@customer.id, "booked")
    if rental
      rental.cancel
      rental.destroy
    end
    rental = nil
    rental = Rental.find_by_customer_id_and_status(@customer.id, "checked_out")
    if rental
      rental.finish
      rental.destroy
    end
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      if (current_customer)
        @customer = current_customer
      else
        @customer =Customer.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:email, :name, :password)
    end
end
