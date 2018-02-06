class RegisterMailersController < ApplicationController
  before_action :set_register_mailer, only: [:show, :edit, :update, :destroy]
  before_action :authorize_customer
  before_action :authorize_admin, only: [:index, :edit, :update, :destroy]
  # GET /register_mailers
  # GET /register_mailers.json
  def index
    @register_mailers = RegisterMailer.all
  end

  # GET /register_mailers/1
  # GET /register_mailers/1.json
  def show
  end

  # GET /register_mailers/new
  def new
    @register_mailer = RegisterMailer.new(:car_id => params[:car_id],:customer_id => params[:customer_id])
  end

  # GET /register_mailers/1/edit
  def edit
  end

  # POST /register_mailers
  # POST /register_mailers.json
  def create
    @register_mailer = RegisterMailer.new(register_mailer_params)

    respond_to do |format|
      if @register_mailer.save
        format.html { redirect_to @register_mailer, notice: 'Register mailer was successfully created.' }
        format.json { render :show, status: :created, location: @register_mailer }
      else
        format.html { render :new }
        format.json { render json: @register_mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_mailers/1
  # PATCH/PUT /register_mailers/1.json
  def update
    respond_to do |format|
      if @register_mailer.update(register_mailer_params)
        format.html { redirect_to @register_mailer, notice: 'Register mailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @register_mailer }
      else
        format.html { render :edit }
        format.json { render json: @register_mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_mailers/1
  # DELETE /register_mailers/1.json
  def destroy
    @register_mailer.destroy
    respond_to do |format|
      format.html { redirect_to register_mailers_url, notice: 'Register mailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_mailer
      @register_mailer = RegisterMailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_mailer_params
      params.require(:register_mailer).permit(:car_id, :customer_id)
    end
end
