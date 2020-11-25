class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transer
    end
  end
  
  def reject_transer
    
  end
  
end


