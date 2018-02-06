class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_superadmin
    if session[:superadmin_id]
      @current_superadmin ||= Superadmin.find(session[:superadmin_id])
    end
  end

  def current_customer
    if session[:customer_id]
       @current_customer ||= Customer.find(session[:customer_id])
    end
  end

  def current_admin

    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    end
  end

  helper_method :current_superadmin
  helper_method :current_customer
  helper_method :current_admin

  def authorize_superadmin
    redirect_to '/logout'  unless current_superadmin
  end


  def authorize_admin
    redirect_to '/logout'  unless (current_admin || current_superadmin)
  end

  def authorize_customer
    redirect_to '/logout' unless (current_customer||current_admin||current_superadmin)
  end
end





