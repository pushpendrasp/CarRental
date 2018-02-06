class SessionsController < ApplicationController
  #before_action :set_sessions_controller, only: [:show, :edit, :update, :destroy]

  # GET /sessions_controllers
  # GET /sessions_controllers.json
  def index
  #@sessions_controllers = SessionsController.all
  end

  # GET /sessions_controllers/1
  # GET /sessions_controllers/1.json
  def show
  end

  # GET /sessions_controllers/new
  def new
    #@sessions_controller = SessionsController.new
  end

  # GET /sessions_controllers/1/edit
  def edit
  end

  # POST /sessions_controllers
  # POST /sessions_controllers.json
  def create
    if Superadmin.find_by_email_and_password(params[:email], params[:password])
      superadmin = Superadmin.find_by_email_and_password(params[:email], params[:password])
      session[:superadmin_id] = superadmin.id
      redirect_to superadmin_url superadmin.id

    elsif Admin.find_by_email_and_password(params[:email], params[:password])
      admin = Admin.find_by_email_and_password(params[:email], params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_url admin.id

    elsif Customer.find_by_email_and_password(params[:email], params[:password])
      customer = Customer.find_by_email_and_password(params[:email], params[:password])
      session[:customer_id] = customer.id
      redirect_to customer_url customer.id
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  # PATCH/PUT /sessions_controllers/1
  # PATCH/PUT /sessions_controllers/1.json


  # DELETE /sessions_controllers/1
  # DELETE /sessions_controllers/1.json
  def destroy
    session[:customer_id] = nil
    session[:admin_id] = nil
    session[:superadmin_id] = nil
    redirect_to '/login'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessions_controller
      #@sessions_controller = SessionsController.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sessions_controller_params
     # params.fetch(:sessions_controller, {})
    end
end
