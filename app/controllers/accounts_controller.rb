class AccountsController < ApplicationController

  def show
    if @current_customer.nil?
      redirect_to login_url
    end

    @account = @current_customer.account
  end

  def transfer
    redirect_to account_url
  end

end
