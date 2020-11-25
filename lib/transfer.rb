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
      sender.balance += amount
      receiver.balance -= amount
    end
  end
  
end


# describe '#execute_transaction' do
#     let(:avi) { BankAccount.new("Avi") }
#     let(:amanda) { BankAccount.new("Amanda") }
#     let(:transfer) { Transfer.new(amanda, avi, 50) }
#     let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

#     it "can execute a successful transaction between two accounts" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       expect(transfer.status).to eq("complete")
#     end

#     it "each transfer can only happen once" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       expect(transfer.status).to eq("complete")
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#     end