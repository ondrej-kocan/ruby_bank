class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_customer

  private

    def set_current_customer
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end

end
