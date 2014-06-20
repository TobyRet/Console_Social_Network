class Action

  attr_reader :messages

  def initialize(user)
    @messages = []
    @user = user
  end

  def post(message)
    @messages << { post: message, time: Time.new }
    puts @messages
  end

end
