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
    end

  end

end