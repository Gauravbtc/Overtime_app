module FakeSms
  Message = Struct.new(:number, :messsage)
  @messages = []

  def self.send_sms(number, messsage)
    @messages << Message.new(number, messsage)
  end

  def self.messages
    @messages
  end


end