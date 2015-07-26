class TransferService

  def initialize(source, target, amount)
    @source_account = source
    @target_account = target
    @amount = amount
  end

  def execute

    Account.transaction do
      @source_account.debit(@amount)
      @target_account.credit(@amount)

      log = TransactionLog.new
      log.source = @source_account
      log.target = @target_account
      log.source_balance_after = @source_account.balance
      log.target_balance_after = @target_account.balance
      log.amount = @amount

      log.save

    end

  end

end