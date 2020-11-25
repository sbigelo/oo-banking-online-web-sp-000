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
    
  end
  
end


 describe '#valid?' do
    it "can check that both accounts are valid" do
      expect(avi.valid?).to eq (true)
      expect(amanda.valid?).to eq(true)
      expect(transfer.valid?).to eq(true)
    end

    it "calls on the sender and receiver's #valid? methods" do
      transfer_class = File.read("lib/transfer.rb")

      expect(amanda).to receive(:valid?).and_return(true)
      expect(avi).to receive(:valid?).and_return(true)

      transfer.