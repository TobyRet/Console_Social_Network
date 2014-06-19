class User

  attr_reader :name
  attr_accessor :messages

  def initialize(name)
    @messages = []
    @name = name
  end

  def post(message)
    @messages << message
    puts messages
  end

end
