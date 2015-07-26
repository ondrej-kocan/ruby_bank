class AccountsController < ApplicationController

  def show
    if @current_customer.nil?
      redirect_to login_url
    end

    @account = @current_customer.account
  end

  def transfer

    amount_string = params[:transfer][:amount]

    if amount_string.nil? || amount_string.blank?
      flash[:danger] = 'Invalid amount'
      redirect_to account_url
      return
    end

    amount = amount_string.to_f

    if amount < 0
      flash[:danger] = 'Cannot transfer negative amount'
      redirect_to account_url
      return
    end

    current_balance = @current_customer.account.balance
    if current_balance < amount
      flash[:danger] = 'Not enough funds to transfer'
      redirect_to account_url
      return
    end

    recipient = Customer.find_by(username: params[:transfer][:recipient])
    if recipient

      source_account = @current_customer.account
      target_account = recipient.account

      TransferService.new(source_account, target_account, amount).execute

    else
      flash[:danger] = 'Unknown user'
    end

    redirect_to account_url
  end

end
