class SessionsController < ApplicationController

  def new
  end

  def create

    customer = Customer.find_by(username: params[:session][:username])
    if customer && customer.authenticate(params[:session][:password])
      session[:customer_id] = customer.id

      # noinspection RailsParamDefResolve
      # action show exists, so we can suppress the warning
      redirect_to account_url

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
  end

end
